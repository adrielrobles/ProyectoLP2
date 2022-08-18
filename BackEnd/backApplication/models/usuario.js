const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('usuario', {
    idusuario: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    correo: {
      type: DataTypes.STRING(20),
      allowNull: false
    },
    contrasena: {
      type: DataTypes.STRING(40),
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'usuario',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "idusuario" },
        ]
      },
    ]
  });
};
