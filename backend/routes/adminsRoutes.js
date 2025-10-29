const express = require("express");
const pool = require("./../db/SabzLearnShop");

const adminsRouter = express.Router();

// GET: دریافت اطلاعات ادمین با توکن
adminsRouter.get("/", async (req, res) => {
  try {
    const adminToken = req.headers.authorization;
    if (!adminToken) {
      return res.status(400).json({ message: "Admin token required" });
    }

    const selectMainAdminQuery = `SELECT * FROM Admins WHERE token = ?`;
    const [result] = await pool.query(selectMainAdminQuery, [adminToken]);

    if (!result.length) {
      return res.status(404).json({ message: "Admin not found" });
    }

    res.status(200).json(result[0]);
  } catch (err) {
    console.error("Error fetching admin:", err);
    res.status(500).json({ message: "Failed to fetch admin", details: err.message });
  }
});

module.exports = adminsRouter;
