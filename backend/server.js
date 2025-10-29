const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const cors = require("cors");
require("dotenv").config();

// Router ها
const productsRouter = require("./routes/productsRoutes");
const commentsRouter = require("./routes/commentsRoutes");
const usersRouter = require("./routes/usersRoutes");
const ordersRouter = require("./routes/ordersRoutes");
const offsRouter = require("./routes/offsRoutes");
const adminsRouter = require("./routes/adminsRoutes");
const addressesRouter = require("./routes/addressesRoutes");
const categoriesRouter = require("./routes/categoriesRoutes");
const bankCardsRouter = require("./routes/bankCardsRoutes");
const profilePicRouter = require("./routes/profilePicRoutes");
const blogsRouter = require("./routes/blogsRoutes");

const app = express();
const server = http.createServer(app);
const path = require("path");

// Socket.io
const io = new Server(server, {
  cors: {
    origin: [
      "http://localhost:3000",
      "http://localhost:8000",
      "https://semielevated-svetlana-crescive.ngrok-free.dev"
    ],
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH"],
},
});

io.on("connection", (socket) => {
  console.log("✅ User connected:", socket.id);

  socket.on("disconnect", () => {
    console.log("❌ User disconnected:", socket.id);
  });
});

// اجازه دسترسی به io از داخل روت‌ها
app.set("io", io);

app.use(cors({
  origin: "*", 
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH"],
  allowedHeaders: ["Content-Type", "Authorization"]
}));


app.use(express.json());

// Middleware برای لاگ درخواست‌ها
app.use((req, res, next) => {
  console.log(`Received ${req.method} request to ${req.url}`);
  next();
});

// روت‌ها
app.use("/api/products", productsRouter);
app.use("/api/blogs", blogsRouter);
app.use("/api/comments", commentsRouter);
app.use("/api/users", usersRouter);
app.use("/api/orders", ordersRouter);
app.use("/api/offs", offsRouter);
app.use("/api/admins", adminsRouter);
app.use("/api/addresses", addressesRouter);
app.use("/api/categories", categoriesRouter);
app.use("/api/cards", bankCardsRouter);
app.use("/api/profilePics", profilePicRouter);

// سرو build فرانت
app.use(express.static(path.join(__dirname, "./../frontend/build")));

app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "./../frontend/build", "index.html"));
});

// 404
app.use((req, res) => {
  res.status(404).send({ message: "Route not found" });
});

// Error handler
app.use((err, req, res, next) => {
  console.error("❌ Error:", err.stack);
  res.status(500).send({ message: "Something went wrong!" });
});

const port = process.env.PORT || 8000;
server.listen(port, '0.0.0.0', () => console.log(`🚀 Server running on port ${port}`));
