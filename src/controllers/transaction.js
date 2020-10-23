/** @format */

const transactionModel = require("../models/transaction");
const formResponse = require("../helpers/forms/form");

const transactionController = {
  addTransaction: (req, res) => {
    transactionModel
      .addTransaction(req.body)
      .then((data) => {
        formResponse.success(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
};

module.exports = transactionController;
