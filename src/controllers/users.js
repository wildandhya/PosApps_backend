/** @format */


const formResponse = require("../helpers/forms/form");
const usersModel = require("../models/user");

const usersController = {
  getUserById: (req, res) => {
    usersModel
      .getUserById(req.params.id)
      .then((data) => {
        
        formResponse.success(res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
};

module.exports = usersController;
