var DataTypes = require("sequelize").DataTypes;
var _ciudadano = require("./ciudadano");
var _denuncia = require("./denuncia");
var _estado = require("./estado");
var _hospital = require("./hospital");
var _usuario = require("./usuario");

function initModels(sequelize) {
  var ciudadano = _ciudadano(sequelize, DataTypes);
  var denuncia = _denuncia(sequelize, DataTypes);
  var estado = _estado(sequelize, DataTypes);
  var hospital = _hospital(sequelize, DataTypes);
  var usuario = _usuario(sequelize, DataTypes);

  denuncia.belongsTo(ciudadano, { as: "idciudadano_ciudadano", foreignKey: "idciudadano"});
  ciudadano.hasMany(denuncia, { as: "denuncia", foreignKey: "idciudadano"});
  denuncia.belongsTo(estado, { as: "idestado_estado", foreignKey: "idestado"});
  estado.hasMany(denuncia, { as: "denuncia", foreignKey: "idestado"});
  denuncia.belongsTo(hospital, { as: "idhospital_hospital", foreignKey: "idhospital"});
  hospital.hasMany(denuncia, { as: "denuncia", foreignKey: "idhospital"});
  ciudadano.belongsTo(usuario, { as: "idusuario_usuario", foreignKey: "idusuario"});
  usuario.hasMany(ciudadano, { as: "ciudadanos", foreignKey: "idusuario"});
  hospital.belongsTo(usuario, { as: "idusuario_usuario", foreignKey: "idusuario"});
  usuario.hasMany(hospital, { as: "hospitals", foreignKey: "idusuario"});

  return {
    ciudadano,
    denuncia,
    estado,
    hospital,
    usuario,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
