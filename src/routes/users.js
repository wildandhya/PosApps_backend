/** @format */

const express = require("express");
const usersRouter = express.Router();

const usersController = require("../controllers/users");

usersRouter.get("/user/:id", usersController.getUserById);

module.exports = usersRouter;
