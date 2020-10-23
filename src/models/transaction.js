/** @format */

const connection = require("../configs/dbMysql");

const transactionModel = {
  // POST
  addTransaction: (body) => {
    // console.log(body)
    const { invoice, cashier, amount, transaction } = body;
    return new Promise((resolve, reject) => {
      const startTransaction = `START TRANSACTION;`;
      const firstQuery = `INSERT INTO history SET invoice = ?, cashier = ?, amount = ?;`;
      const secondQuery = `INSERT INTO orders (invoice_id, menu_id, quantity) VALUES ?;`;
      const endTransaction = `COMMIT;`;
      const joinQuery =
        startTransaction + firstQuery + secondQuery + endTransaction;
      let totalOrder = transaction.map((item) => {
        return [invoice, item.menu_id, item.quantity];
      });
      connection.query(
        joinQuery,
        [invoice, cashier, amount, totalOrder],
        (err, data) => {
          // console.log(data);
          if (!err) {
            resolve(data);
          } else {
            reject(err);
          }
        }
      );
    });
  },
};

module.exports = transactionModel;
