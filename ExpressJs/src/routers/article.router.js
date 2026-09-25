import express from "express";
import { articleController } from "../controllers/article.controller.js";

const articelRouter = express.Router();

// READ
articelRouter.get("/", articleController.findAll);

// CREATE
articelRouter.post("", articleController.create);

// UPDATE
articelRouter.put("/:articleID", articleController.update);

// DELETE
articelRouter.delete("/:articleID", articleController.delete);

export default articelRouter;
