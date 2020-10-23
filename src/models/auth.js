/** @format */

const db = require("../configs/dbMysql");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const authModel = {
  register: (body) => {
    return new Promise((resolve, reject) => {
      const checkUsername = "SELECT name FROM users WHERE name = ?";
      db.query(checkUsername, [body.name], (err, data) => {
        if (data.length) {
          reject({ msg: " Your name already exist" });
        } else {
          bcrypt.genSalt(10, (err, salt) => {
            if (err) {
              reject(err);
            }
            const { password } = body;
            bcrypt.hash(password, salt, (err, hashedPassword) => {
              if (err) {
                reject(err);
              }
              const newBody = { ...body, password: hashedPassword };
              const qs = "INSERT INTO users SET ?";
              db.query(qs, newBody, (err, data) => {
                if (!err) {
                  resolve(data);
                } else {
                  reject(err);
                }
              });
            });
          });
        }
      });
    });
  },
  login: (body) => {
    return new Promise((resolve, reject) => {
      const checkUsername = "SELECT email FROM users WHERE email = ?";
      db.query(checkUsername, [body.email], (err, data) => {
        // console.log(data)
        if (!data.length) {
          reject("msg: email not found");
        } else {
          const qs =
            "SELECT users.email, users.password, users.level_id FROM users WHERE users.email=?";
          db.query(qs, [body.email], (err, data) => {
            // console.log(data)
            if (err) {
              reject(err);
            }
            if (data.length) {
              bcrypt.compare(body.password, data[0].password, (err, result) => {
                if (result) {
                  const { name, email } = body;
                  const { level_id } = data[0];
                  const payload = {
                    name,
                    email,
                    level_id,
                  };
                  const token = jwt.sign(payload, process.env.SECRET_KEY);
                  const msg = "login success";
                  const level = level_id
                  const nameUser = name
                  const emailUser = email
                  resolve({ msg, token, level, nameUser, emailUser });
                }
                if (!result) {
                  reject({
                    msg: "wrong password",
                  });
                }
                if (err) {
                  reject(err);
                }
              });
            }
          });
        }
      });
    });
  },
};

module.exports = authModel;
