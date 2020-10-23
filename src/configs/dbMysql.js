require('dotenv/config')
const mysql = require('mysql');

const db = mysql.createConnection({
    host: process.env.host,
    user: process.env.user,
    database: process.env.database,
    password: process.env.password,
});

db.connect(err => {
    if (err) throw err;
    console.log('database connected');
});

module.exports = db;