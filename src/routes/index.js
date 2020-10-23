/** @format */

const express = require("express");
const router = express.Router();

const productRouter = require("./product");
const historyRouter = require("./history");
const authRouter = require("./auth");
const transactionRouter = require("./transaction");
const usersRouter = require("./users");
router.use("/", productRouter);
router.use("/", historyRouter);
router.use("/", authRouter);
router.use("/", transactionRouter);
router.use("/", usersRouter);

module.exports = router;
