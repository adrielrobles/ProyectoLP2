var express = require('express');
const { Op } = require("sequelize");

var router = express.Router();

const Sequelize = require('../models/index.js').sequelize;

const initModels = require('../models/init-models');

var models= initModels(Sequelize)
/* GET users listing. */
router.get('/', function(req, res, next) {
  models.hospital.findAll({
    attributes: { exclude: ["updatedAt"] }
}).then(hospitales => {
    res.status(200).send(hospitales)
}).catch(error => res.status(400).send(error));});

module.exports = router;
