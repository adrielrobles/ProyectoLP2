var express = require('express');
const denuncia = require('../models/denuncia.js');

var router = express.Router();

const Sequelize = require('../models/index.js').sequelize;

const initModels = require('../models/init-models');

var models= initModels(Sequelize)

/* GET Recuperar Todas las denuncias por ciudadano. */
router.get('/:idciudadano' , async (req , res , next) => {

  let idciudadano = req.params.idciudadano;

  models.denuncia.findAll({
      attributes: { exclude: ["updatedAt"] },
      where: {idciudadano : idciudadano}
  }).then(denuncia => {
      res.status(200).send(denuncia)
  }).catch(error => res.status(400).send(error));
});

/*Post: Crear Denuncia */
router.post('/' ,async (req , res , next) => {
  let titulo = req.body.titulo;
  let descripcion = req.body.descripcion;
  let idciudadano = req.body.idciudadano;
  let idhospital = req.body.idhospital;
  try{
      let denuncia = await models.denuncia.create({
          titulo : titulo,
          descripcion: descripcion,
          num_Apoyos : 0,
          idciudadano: idciudadano,
          idhospital: idhospital,
          idestado:1
      },
      {   fields : ['titulo' , 'descripcion' , 'num_Apoyos','idciudadano','idhospital','idestado'] }
      );

      console.log('marca: '  , denuncia);

      res.status(201).json({
          message: "Denuncia creada con exito!",
          content: denuncia
      });

  }catch(error){
      console.log('Error: ',error);
      res.status(404).send(error)
  }
  
});

module.exports = router;
