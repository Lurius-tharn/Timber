const express = require('express');
const router = express.Router();

const userController = require('../controller/UserController');
const departementController = require('../controller/departementController');
router.get("/connecter/:login/:password", userController.getUser);
router.get("/membres", userController.getUsers);
router.get("/membres/:idUser", userController.getUsers);

router.get("/dept/:numDepartement", departementController.getDepartementFromNum);
router.post("/liked", userController.newLikedProfile);
router.get("/liked/:idUser", userController.getLikedUsers);

module.exports = router