const express = require("express");
const router = express.Router();
const pool = require ("./../db/SabzLearnShop")


// 📌 گرفتن همه‌ی پروفایل‌ها
router.get("/", async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM user_profiles");
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: "Database error" });
  }
});


// 📌 گرفتن پروفایل بر اساس user_id
router.get("/:user_id", async (req, res) => {
  const { user_id } = req.params;
  try {
    const [rows] = await pool.query("SELECT * FROM user_profiles WHERE user_id = ?", [user_id]);
    if (rows.length === 0) return res.status(404).json({ error: "Profile not found" });
    res.json(rows[0]);
  } catch (err) {
    res.status(500).json({ error: "Database error" });
  }
});


// 📌 ساخت پروفایل جدید
router.post("/", async (req, res) => {
  const { user_id, profile_image } = req.body;
  try {
    const [result] = await pool.query(
      "INSERT INTO user_profiles (user_id, profile_image) VALUES (?, ?)",
      [user_id, profile_image]
    );
    res.json({ id: result.insertId, user_id, profile_image });
  } catch (err) {
    res.status(500).json({ error: "Database error" });
  }
});


// 📌 آپدیت پروفایل
router.put("/:user_id", async (req, res) => {
  const { user_id } = req.params;
  const { profile_image } = req.body;
  try {
    const [result] = await pool.query(
      "UPDATE user_profiles SET profile_image = ?, updated_at = CURRENT_TIMESTAMP WHERE user_id = ?",
      [profile_image, user_id]
    );
    if (result.affectedRows === 0) return res.status(404).json({ error: "Profile not found" });
    res.json({ message: "Profile updated", user_id, profile_image });
  } catch (err) {
    res.status(500).json({ error: "Database error" });
  }
});


// 📌 حذف پروفایل
router.delete("/:user_id", async (req, res) => {
  const { user_id } = req.params;
  try {
    const [result] = await pool.query("DELETE FROM user_profiles WHERE user_id = ?", [user_id]);
    if (result.affectedRows === 0) return res.status(404).json({ error: "Profile not found" });
    res.json({ message: "Profile deleted" });
  } catch (err) {
    res.status(500).json({ error: "Database error" });
  }
});


module.exports = router;
