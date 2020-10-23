/** @format */

const express = require("express");
const productRouter = express.Router();

const productController = require("../controllers/product");
const checkToken = require("../helpers/middlewares/checkToken");
const fileUpload = require("../helpers/middlewares/fileUpload");

productRouter.get("/product", productController.showProduct);
productRouter.get("/search", productController.searchMenu);
productRouter.post(
  "/product",
  // checkToken.admin,
  fileUpload.singleUpload,
  productController.addProduct
);

productRouter.put(
  "/product/:id",
  // checkToken.admin,
  fileUpload.singleUpload,
  productController.updateProduct
);
productRouter.delete(
  "/product/:id",
  // checkToken.admin,
  productController.deleteProduct
);

module.exports = productRouter;
