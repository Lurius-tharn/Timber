const express = require('express');
const router = express.Router();

const userController = require('../controller/UserController');

//connectController Declaration
router.get("/connecter", userController.getUser);
router.get("/membres", userController.getUsers);

module.exports = router