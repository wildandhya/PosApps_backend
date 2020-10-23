/** @format */

const express = require("express");
const historyRouter = express.Router();

const historyController = require("../controllers/history");
const checkToken = require("../helpers/middlewares/checkToken");

historyRouter.get("/history", historyController.showHistory);
historyRouter.get("/history/income-today", historyController.todayIncome);
historyRouter.get("/history/order-week", historyController.totalOrderByWeek);
historyRouter.get("/history/income-year", historyController.incomeByYear);
historyRouter.get("/history/revenue-month", historyController.revenueByMonth);
module.exports = historyRouter;
