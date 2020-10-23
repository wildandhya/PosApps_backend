/** @format */

const express = require("express");
const transactionRouter = express.Router();

const transactionController = require("../controllers/transaction");

transactionRouter.post("/transaction", transactionController.addTransaction);

module.exports = transactionRouter;
