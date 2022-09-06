var express = require('express');
const { Op } = require("sequelize");

var router = express.Router();

const Sequelize = require('../models/index.js').sequelize;

const initModels = require('../models/init-models');

var models= initModels(Sequelize)

function compare(x, y) {
  return (x < y ? -1 : (x > y ? 1 : 0));
}
/* GET users listing. */
router.post('/', async (req, res, next) => {
  let correo= req.body.correo
  let contrasena= req.body.contrasena
  const user = await models.usuario.findOne({
    where: { correo : correo}
  })
  
  if(user){
    const iguales =  compare(contrasena,user.contrasena);
    if(iguales==0){
        const ciudadano = await models.ciudadano.findOne({
          where: { idusuario : user.idusuario}
        })
        res.json({message:'OK', idciudadano: ciudadano.idciudadano})
    }else{
      res.status(400).json({ error :'Error en usuario y/o contraseña '})
    }
  }else{
    res.status(400).json({ error :'Error en usuario y/o contraseña '})
  }
});

module.exports = router;
