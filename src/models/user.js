/** @format */

const connection = require("../configs/dbMysql");

const usersModel = {
  getUserById: (id) => {
    return new Promise((resolve, reject) => {
      const queryString = `SELECT users.name, users.email, users.level_id FROM users WHERE users.id = ?`;
      connection.query(queryString,[id], (err, data) => {
        if (!err) {
          resolve(data);
        } else {
          reject(err);
        }
      });
    });
  },
}

module.exports = usersModel;
