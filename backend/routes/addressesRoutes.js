const express = require("express");
const jwt = require("jsonwebtoken");
const pool = require("./../db/SabzLearnShop");
const util = require("util");
require("dotenv").config();

const addressesRouter = express.Router();
const query = util.promisify(pool.query).bind(pool);

// Middleware to verify JWT token
const authenticateToken = (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];
  if (!token) return res.status(401).json({ message: "Authentication token required" });

  try {
    const user = jwt.verify(token, process.env.JWT_SECRET);
    req.user = user; // شامل id و role
    next();
  } catch {
    return res.status(403).json({ message: "Invalid or expired token" });
  }
};

// GET: دریافت همه آدرس‌های کاربر
addressesRouter.get("/", authenticateToken, async (req, res) => {
  try {
    const userID = req.user.id;

    const result = await query(
      `SELECT 
         id,
         user_id AS userID,
         province,
         address,
         city,
         postal_code AS postalCode,
         address_type AS addressType,
         created_at AS createdAt
       FROM addresses
       WHERE user_id = ?`,
      [userID]
    );

    res.status(200).json(result);
  } catch (err) {
    console.error("Error fetching addresses:", err);
    res.status(500).json({ error: err.message });
  }
});

// POST: افزودن آدرس جدید
addressesRouter.post("/", authenticateToken, async (req, res) => {
  try {
    const { province, address, city, postalCode, addressType } = req.body;

    if (
      !province ||
      !address ||
      !city ||
      !postalCode ||
      !["HOME", "WORK", "OTHER"].includes(addressType)
    ) {
      return res.status(400).json({ error: "ورودی‌ها نامعتبر هستند" });
    }
    if (!/^\d{10}$/.test(postalCode)) {
      return res.status(400).json({ error: "کد پستی باید 10 رقمی باشد" });
    }

    const userID = req.user.id;

    const result = await query(
      `INSERT INTO addresses (user_id, province, address, city, postal_code, address_type)
       VALUES (?, ?, ?, ?, ?, ?)`,
      [userID, province.trim(), address.trim(), city.trim(), postalCode, addressType]
    );

    res
      .status(201)
      .json({ message: "آدرس با موفقیت اضافه شد", addressID: result.insertId });
  } catch (err) {
    console.error("Error adding address:", err);
    res.status(500).json({ error: err.message });
  }
});

// PUT: ویرایش آدرس
addressesRouter.put("/:addressID", authenticateToken, async (req, res) => {
  try {
    const addressID = parseInt(req.params.addressID);
    const { province, address, city, postalCode, addressType } = req.body;

    if (isNaN(addressID)) return res.status(400).json({ error: "شناسه آدرس نامعتبر است" });
    if (
      !province ||
      !address ||
      !city ||
      !postalCode ||
      !["HOME", "WORK", "OTHER"].includes(addressType)
    ) {
      return res.status(400).json({ error: "ورودی‌ها نامعتبر هستند" });
    }
    if (!/^\d{10}$/.test(postalCode))
      return res.status(400).json({ error: "کد پستی باید 10 رقمی باشد" });

    const userID = req.user.id;

    const result = await query(
      `UPDATE addresses
       SET province = ?, address = ?, city = ?, postal_code = ?, address_type = ?
       WHERE id = ? AND user_id = ?`,
      [province.trim(), address.trim(), city.trim(), postalCode, addressType, addressID, userID]
    );

    if (result.affectedRows === 0)
      return res.status(404).json({ error: "آدرس یافت نشد یا متعلق به کاربر نیست" });

    res.status(200).json({ message: "آدرس با موفقیت ویرایش شد" });
  } catch (err) {
    console.error("Error updating address:", err);
    res.status(500).json({ error: err.message });
  }
});

// DELETE: حذف آدرس
addressesRouter.delete("/:addressID", authenticateToken, async (req, res) => {
  try {
    const addressID = parseInt(req.params.addressID);
    if (isNaN(addressID)) return res.status(400).json({ error: "شناسه آدرس نامعتبر است" });

    const userID = req.user.id;

    const result = await query(
      `DELETE FROM addresses WHERE id = ? AND user_id = ?`,
      [addressID, userID]
    );

    if (result.affectedRows === 0)
      return res.status(404).json({ error: "آدرس یافت نشد یا متعلق به کاربر نیست" });

    res.status(200).json({ message: "آدرس با موفقیت حذف شد" });
  } catch (err) {
    console.error("Error deleting address:", err);
    res.status(500).json({ error: err.message });
  }
});

module.exports = addressesRouter;
