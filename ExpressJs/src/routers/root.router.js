import express from "express";
import articelRouter from "./article.router.js";

// Router: là một đối tượng của express, dùng để quản lý các route
const rootRouter = express.Router();
rootRouter.use("/article", articelRouter);
export default rootRouter;
