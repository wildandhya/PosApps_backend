/** @format */

const multer = require("multer");
const path = require("path");

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./public/images");
  },
  filename: (req, file, cb) => {
    const nameformat = `${Date.now()}-${file.fieldname}${path.extname(
      file.originalname
    )}`;
    cb(null, nameformat);
  },
});

const limits = {
  fileSize: 5 * 1000 * 1000,
};

const fileFilter = (req, file, cb) => {
  const filetype = /JPG|JPEG|PNG|GIF/;
  const extname = filetype.test(
    path.extname(file.originalname).toLocaleUpperCase()
  );
  if (extname) {
    cb(null, true);
  } else {
    cb("error: Image only");
  }
};

const upload = multer({
  storage,
  limits,
  fileFilter,
});

const fileUpload = {
  singleUpload: (req, res, next) => {
    const singleUpload = upload.single("image");
    singleUpload(req, res, (err) => {
      if (err) {
        res.json({
          msg: err,
        });
      } else {
        try {
          req.body.image = `http://localhost:8000/images/${req.file.filename}`;
        } catch (err) {
          console.log(err);
        } finally {
          next();
        }
      }
    });
  },
};

module.exports = fileUpload;
