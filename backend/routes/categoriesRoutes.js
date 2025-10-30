const express = require("express");
const pool = require("./../db/DidikalaDB");

const categoriesRouter = express.Router();

// GET: دریافت تمام دسته‌بندی‌ها
categoriesRouter.get("/", async (req, res) => {
  try {
    const selectAllCategoriesQuery = `
      SELECT 
        id, 
        title, 
        parent_id 
      FROM Categories
    `;
    const [result] = await pool.query(selectAllCategoriesQuery);

    const formattedResult = result.map((category) => ({
      id: Number(category.id),
      title: category.title,
      parent_id: category.parent_id ? Number(category.parent_id) : null,
    }));

    res.status(200).json(formattedResult);
  } catch (err) {
    console.error("Error fetching categories:", err);
    res.status(500).json({ message: "Failed to fetch categories", details: err.message });
  }
});

// DELETE: حذف یک دسته‌بندی
categoriesRouter.delete("/:categoryID", async (req, res) => {
  try {
    const categoryID = parseInt(req.params.categoryID);
    if (isNaN(categoryID)) return res.status(400).json({ message: "Invalid categoryID" });

    const [result] = await pool.query("DELETE FROM Categories WHERE id = ?", [categoryID]);
    if (result.affectedRows === 0) return res.status(404).json({ message: "Category not found" });

    res.status(200).json({ message: "Category deleted successfully" });
  } catch (err) {
    console.error("Error deleting category:", err);
    res.status(500).json({ message: "Failed to delete category", details: err.message });
  }
});

// PUT: فعال/غیرفعال کردن دسته‌بندی
categoriesRouter.put("/active-category/:categoryID/:isActive", async (req, res) => {
  try {
    const categoryID = parseInt(req.params.categoryID);
    const isActive = req.params.isActive === "1" ? 1 : 0;

    if (isNaN(categoryID)) return res.status(400).json({ message: "Invalid categoryID" });

    const [result] = await pool.query("UPDATE Categories SET isActive = ? WHERE id = ?", [isActive, categoryID]);
    if (result.affectedRows === 0) return res.status(404).json({ message: "Category not found" });

    res.status(200).json({ message: "Category status updated successfully" });
  } catch (err) {
    console.error("Error updating category:", err);
    res.status(500).json({ message: "Failed to update category", details: err.message });
  }
});

module.exports = categoriesRouter;
