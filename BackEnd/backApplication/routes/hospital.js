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

router.get('/search', async function(req, res, next) {
  let nombre = req.query.nombre.toLowerCase();
  models.hospital.findAll({
    limit: 10,
    where: {
        nombre: Sequelize.where(Sequelize.fn('LOWER', Sequelize.col('nombre')), 'LIKE', '%' + nombre + '%')
    }
}).then(function(hospitales){
    res.status(200).send(hospitales)
}).catch(function(error){
    console.log(error);
});
});



module.exports = router;
