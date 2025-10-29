const express = require("express");
const pool = require("./../db/SabzLearnShop");
const util = require("util");

const commentsRouter = express.Router();
const query = util.promisify(pool.query).bind(pool);

// تابع کمکی برای دریافت یک نظر با جزئیات کامل
async function fetchCommentByID(commentID) {
  const result = await query(
    `SELECT 
       c.id, c.body, c.created_at, c.is_reply, c.reply_id, c.status, 
       u.id AS userID, u.username AS userName, u.role AS userRole, 
       p.id AS productID, p.title AS productTitle
     FROM comments c
     INNER JOIN users u ON u.id = c.userID
     INNER JOIN products p ON p.id = c.productID
     WHERE c.id = ?`,
    [commentID]
  );
  return result[0];
}

// GET: دریافت همه نظرات تأییدشده
commentsRouter.get("/", async (req, res) => {
  try {
    const { productID } = req.query;
    let selectAllCommentsQuery = `
      SELECT 
        c.id, c.body, c.created_at, c.is_reply, c.reply_id, c.status, 
        u.id AS userID, u.username AS userName, u.role AS userRole, 
        p.id AS productID, p.title AS productTitle
      FROM comments c
      INNER JOIN users u ON u.id = c.userID 
      INNER JOIN products p ON p.id = c.productID
      WHERE c.status = 'approved'
    `;
    const queryParams = [];

    if (productID && /^\d+$/.test(productID)) {
      selectAllCommentsQuery += ` AND c.productID = ?`;
      queryParams.push(Number(productID));
    }

    selectAllCommentsQuery += ` ORDER BY c.created_at DESC`;

    const result = await query(selectAllCommentsQuery, queryParams);
    res.status(200).json(result);
  } catch (err) {
    console.error("Error fetching comments:", err);
    res.status(500).json({ message: "خطا در دریافت نظرات", details: err.message });
  }
});

// DELETE: حذف نظر
commentsRouter.delete("/:commentID", async (req, res) => {
  try {
    const commentID = parseInt(req.params.commentID);
    if (isNaN(commentID)) return res.status(400).json({ message: "شناسه نظر نامعتبر است" });

    const result = await query("DELETE FROM comments WHERE id = ?", [commentID]);
    if (result.affectedRows === 0) return res.status(404).json({ message: "نظر یافت نشد" });

    res.status(200).json({ message: "نظر با موفقیت حذف شد" });
  } catch (err) {
    console.error("Error deleting comment:", err);
    res.status(500).json({ message: "خطا در حذف نظر", details: err.message });
  }
});

// PUT: ویرایش نظر
commentsRouter.put("/:commentID", async (req, res) => {
  try {
    const commentID = parseInt(req.params.commentID);
    const { body } = req.body;

    if (isNaN(commentID)) return res.status(400).json({ message: "شناسه نظر نامعتبر است" });
    if (!body || typeof body !== "string" || body.trim() === "") {
      return res.status(400).json({ message: "متن نظر نامعتبر است" });
    }

    const result = await query(
      "UPDATE comments SET body = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?",
      [body.trim(), commentID]
    );
    if (result.affectedRows === 0) return res.status(404).json({ message: "نظر یافت نشد" });

    const updatedComment = await fetchCommentByID(commentID);
    res.status(200).json(updatedComment);
  } catch (err) {
    console.error("Error updating comment:", err);
    res.status(500).json({ message: "خطا در ویرایش نظر", details: err.message });
  }
});

// POST: تأیید نظر
commentsRouter.post("/accept/:commentID", async (req, res) => {
  try {
    const commentID = parseInt(req.params.commentID);
    if (isNaN(commentID)) return res.status(400).json({ message: "شناسه نظر نامعتبر است" });

    const result = await query("UPDATE comments SET status = 'approved' WHERE id = ?", [commentID]);
    if (result.affectedRows === 0) return res.status(404).json({ message: "نظر یافت نشد" });

    const acceptedComment = await fetchCommentByID(commentID);
    res.status(200).json(acceptedComment);
  } catch (err) {
    console.error("Error accepting comment:", err);
    res.status(500).json({ message: "خطا در تأیید نظر", details: err.message });
  }
});

// POST: رد نظر
commentsRouter.post("/reject/:commentID", async (req, res) => {
  try {
    const commentID = parseInt(req.params.commentID);
    if (isNaN(commentID)) return res.status(400).json({ message: "شناسه نظر نامعتبر است" });

    const result = await query("UPDATE comments SET status = 'rejected' WHERE id = ?", [commentID]);
    if (result.affectedRows === 0) return res.status(404).json({ message: "نظر یافت نشد" });

    res.status(200).json({ message: "نظر با موفقیت رد شد" });
  } catch (err) {
    console.error("Error rejecting comment:", err);
    res.status(500).json({ message: "خطا در رد نظر", details: err.message });
  }
});

// POST: افزودن نظر جدید
commentsRouter.post("/", async (req, res) => {
  try {
    const { body, userID, productID, is_reply = 0, reply_id = null } = req.body;

    if (!body || typeof body !== "string" || body.trim() === "")
      return res.status(400).json({ message: "متن نظر نامعتبر است" });
    if (!/^\d+$/.test(userID) || !/^\d+$/.test(productID))
      return res.status(400).json({ message: "شناسه کاربر یا محصول نامعتبر است" });
    if (is_reply && !/^\d+$/.test(reply_id))
      return res.status(400).json({ message: "شناسه پاسخ نامعتبر است" });

    const result = await query(
      `INSERT INTO comments (body, userID, productID, is_reply, reply_id, status) VALUES (?, ?, ?, ?, ?, 'pending')`,
      [body.trim(), userID, productID, is_reply, reply_id || null]
    );

    const newComment = await fetchCommentByID(result.insertId);
    res.status(201).json(newComment);
  } catch (err) {
    console.error("Error adding comment:", err);
    res.status(500).json({ message: "خطا در افزودن نظر", details: err.message });
  }
});

module.exports = commentsRouter;
