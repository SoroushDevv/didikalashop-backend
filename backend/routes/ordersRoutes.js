const express = require("express");
const pool = require("./../db/SabzLearnShop");
const ordersRouter = express.Router();
const jwt = require("jsonwebtoken");
const util = require("util");
require('dotenv').config();

// تبدیل متد query دیتابیس به promise برای استفاده با async/await
const query = util.promisify(pool.query).bind(pool);

// Middleware برای اعتبارسنجی توکن JWT
const authenticateToken = (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];

  if (!token) return res.status(401).json({ message: "Authentication token required" });

  jwt.verify(token, process.env.JWT_SECRET || "your-secret-key", (err, user) => {
    if (err) return res.status(403).json({ message: "Invalid or expired token" });
    req.user = user;
    next();
  });
};

// ثبت سفارش جدید (تک یا چند محصولی)
ordersRouter.post("/", authenticateToken, async (req, res) => {
  try {
    const { userID, date, hour, items } = req.body;

    // اعتبارسنجی داده‌ها
    if (!userID || isNaN(userID)) return res.status(400).json({ message: "UserID required" });
    if (!date || !/^\d{4}-\d{2}-\d{2}$/.test(date)) return res.status(400).json({ message: "Invalid date format" });
    if (!hour || !/^\d{2}:\d{2}:\d{2}$/.test(hour)) return res.status(400).json({ message: "Invalid hour format" });
    if (!Array.isArray(items) || items.length === 0) return res.status(400).json({ message: "Order must contain at least one product" });

    // بررسی وجود کاربر
    const userResult = await query("SELECT id FROM users WHERE id = ?", [userID]);
    if (userResult.length === 0) return res.status(404).json({ message: "User not found" });

    // ایجاد رکورد سفارش در جدول orders
    const orderInsert = await query(
      `INSERT INTO orders (userID, date, hour, isActive)
       VALUES (?, ?, ?, ?)`,
      [userID, date, hour, true]
    );

    const orderID = orderInsert.insertId;
    const orderItems = [];

    // پردازش تک‌تک محصولات
    for (const item of items) {
      const { productID, quantity = 1, color } = item;
      if (!productID || isNaN(productID)) continue;
      if (!color || color.trim() === "") continue;

      // بررسی محصول در دیتابیس
      const productResult = await query("SELECT id, price FROM products WHERE id = ?", [productID]);
      if (productResult.length === 0) continue;

      const price = productResult[0].price;

      // درج در جدول order_items
      await query(
        `INSERT INTO order_items (orderID, productID, quantity, color, price)
         VALUES (?, ?, ?, ?, ?)`,
        [orderID, productID, quantity, color, price]
      );

      orderItems.push({ productID, quantity, color, price });
    }

    const newOrder = {
      orderID,
      userID,
      date,
      hour,
      isActive: true,
      items: orderItems
    };

    // ارسال event به کلاینت‌ها
    const io = req.app.get("io");
    io.emit("order_created", newOrder);

    res.status(201).json({ message: "Order created successfully", order: newOrder });
  } catch (err) {
    console.error("Database error:", err);
    res.status(500).json({ message: "Database error", details: err.message });
  }
});

// دریافت همه سفارش‌ها همراه با آیتم‌ها
ordersRouter.get("/", async (req, res) => {
  try {
    const orders = await query(`
      SELECT o.id as orderID, o.userID, o.date, o.hour, o.isActive,
             oi.id as orderItemID, oi.productID, oi.quantity, oi.color, oi.price
      FROM orders o
      LEFT JOIN order_items oi ON o.id = oi.orderID
      ORDER BY o.date DESC, o.hour DESC
    `);

    // تجمیع آیتم‌ها برای هر سفارش
    const ordersMap = {};
    orders.forEach(row => {
      if (!ordersMap[row.orderID]) {
        ordersMap[row.orderID] = {
          orderID: row.orderID,
          userID: row.userID,
          date: row.date,
          hour: row.hour,
          isActive: row.isActive,
          items: []
        };
      }
      if (row.orderItemID) {
        ordersMap[row.orderID].items.push({
          orderItemID: row.orderItemID,
          productID: row.productID,
          quantity: row.quantity,
          color: row.color,
          price: row.price
        });
      }
    });

    res.status(200).json(Object.values(ordersMap));
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Database error", details: err.message });
  }
});

// دریافت سفارش‌های یک کاربر خاص همراه با آیتم‌ها
ordersRouter.get("/user/:userID", async (req, res) => {
  try {
    const userID = parseInt(req.params.userID);
    if (isNaN(userID)) return res.status(400).json({ message: "Invalid userID" });

    const orders = await query(`
      SELECT o.id as orderID, o.userID, o.date, o.hour, o.isActive,
             oi.id as orderItemID, oi.productID, oi.quantity, oi.color, oi.price
      FROM orders o
      LEFT JOIN order_items oi ON o.id = oi.orderID
      WHERE o.userID = ?
      ORDER BY o.date DESC, o.hour DESC
    `, [userID]);

    const ordersMap = {};
    orders.forEach(row => {
      if (!ordersMap[row.orderID]) {
        ordersMap[row.orderID] = {
          orderID: row.orderID,
          userID: row.userID,
          date: row.date,
          hour: row.hour,
          isActive: row.isActive,
          items: []
        };
      }
      if (row.orderItemID) {
        ordersMap[row.orderID].items.push({
          orderItemID: row.orderItemID,
          productID: row.productID,
          quantity: row.quantity,
          color: row.color,
          price: row.price
        });
      }
    });

    res.status(200).json(Object.values(ordersMap));
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Database error", details: err.message });
  }
});

// حذف سفارش به همراه آیتم‌ها
ordersRouter.delete("/:orderID", async (req, res) => {
  try {
    const orderID = parseInt(req.params.orderID);
    if (isNaN(orderID)) return res.status(400).json({ message: "Invalid orderID" });

    // حذف رکوردهای order_items
    await query("DELETE FROM order_items WHERE orderID = ?", [orderID]);
    // حذف رکورد سفارش
    const result = await query("DELETE FROM orders WHERE id = ?", [orderID]);

    if (result.affectedRows === 0) return res.status(404).json({ message: "Order not found" });

    const io = req.app.get("io");
    io.emit("order_deleted", { orderID });

    res.status(200).json({ message: "Order deleted successfully" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Database error", details: err.message });
  }
});

// بروزرسانی سفارش و آیتم‌ها
ordersRouter.put("/active-order/:orderID", async (req, res) => {
  try {
    const orderID = parseInt(req.params.orderID);
    const { isActive, items } = req.body;

    if (isNaN(orderID) || orderID <= 0) return res.status(400).json({ message: "Invalid orderID" });

    // بروزرسانی فیلد isActive سفارش
    if (isActive !== undefined) {
      await query("UPDATE orders SET isActive = ? WHERE id = ?", [isActive ? 1 : 0, orderID]);
    }

    // بروزرسانی آیتم‌ها
    if (Array.isArray(items)) {
      for (const item of items) {
        const { orderItemID, quantity, color } = item;
        const updates = [];
        const values = [];

        if (quantity !== undefined) {
          updates.push("quantity = ?");
          values.push(quantity);
        }
        if (color !== undefined) {
          updates.push("color = ?");
          values.push(color);
        }
        if (updates.length > 0 && orderItemID) {
          values.push(orderItemID);
          await query(`UPDATE order_items SET ${updates.join(", ")} WHERE id = ?`, values);
        }
      }
    }

    const io = req.app.get("io");
    io.emit("order_updated", { orderID, isActive, items });

    res.status(200).json({ message: "Order updated successfully" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Database error", details: err.message });
  }
});

module.exports = ordersRouter;
