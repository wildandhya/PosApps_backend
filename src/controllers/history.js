/** @format */

const historyModel = require("../models/history");
const formResponse = require("../helpers/forms/form");

const historyController = {
  incomeByYear: (req, res) => {
    historyModel
      .incomeByYear()
      .then((data) => {
        formResponse.success(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  showHistory: (req, res) => {
    historyModel
      .showHistory()
      .then((data) => {
        formResponse.success(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  totalOrderByWeek: (req, res) => {
    historyModel
      .totalOrderByWeek()
      .then((data) => {
        formResponse.success(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  todayIncome: (req, res) => {
    historyModel
      .todayIncome()
      .then((data) => {
        formResponse.success(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  revenueByMonth: (req, res) => {
    historyModel
      .revenueByMonth()
      .then((data) => {
        formResponse.success(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
};

module.exports = historyController;
