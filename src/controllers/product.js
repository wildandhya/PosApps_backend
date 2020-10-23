/** @format */

const productModel = require("../models/product");

const formResponse = require("../helpers/forms/form");

const productController = {
  showProduct: (req, res) => {
    productModel
      .showProduct(req.query)
      .then((data) => {
        formResponse.pagination(req, res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
  searchMenu: (req, res) => {
    productModel
      .searchMenu(req.query)
      .then((data) => {
        formResponse.pagination(req, res, data);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },


  addProduct: (req, res) => {
    productModel
      .addProduct(req.body)
      .then((data) => {
        const responData = {
          ...req.body,
          id: data.insertId,
          create_at: Date.now(),
          update_at: Date.now(),
        };
        formResponse.success(res, responData);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },

  updateProduct: (req, res) => {
    productModel
      .updateProduct(req.params.id, req.body)
      .then((data) => {
        const responData = {
          ...req.body,
          update_at: Date.now(),
        };
        formResponse.success(res, responData);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },

  deleteProduct: (req, res) => {
    productModel
      .deleteProduct(req.params.id)
      .then((data) => {
        const paramId = req.params.id

        const responData = {
          id:parseInt(paramId),
          msg: "delete product success",
        };
        console.log(responData)
        formResponse.success(res, responData);
      })
      .catch((err) => {
        formResponse.error(res, err);
      });
  },
};

module.exports = productController;
