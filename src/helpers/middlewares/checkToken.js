/** @format */

const jwt = require("jsonwebtoken");
const formResponse = require("../forms/form");

const checkToken= {
  admin:(req, res, next) => {
    const bearerToken = req.header("x-access-token");
    if (!bearerToken) {
      res.json({
        msg: "please login dong",
      });
    }
    try {
      const token = bearerToken.split(" ")[1];
      const decoded = jwt.verify(token, process.env.SECRET_KEY);
      if (decoded.level_id === 2) {
        req.decodedToken = decoded;
        next();
      } else {
        res.json("msg: Sorry only admin have access to this page");
      }
    } catch (e) {
      formResponse.error(res, e);
    }
  },
  user:(req, res, next) => {
    const bearerToken = req.header("x-access-token");
    if (!bearerToken) {
      res.json({
        msg: "please login dong",
      });
    }
    try {
      const token = bearerToken.split(" ")[1];
      const decoded = jwt.verify(token, process.env.SECRET_KEY);
      req.decodedToken = decoded;
      next();
    } catch (e) {
      formResponse.error(res, e);
    }
  },
} 

module.exports = checkToken;
