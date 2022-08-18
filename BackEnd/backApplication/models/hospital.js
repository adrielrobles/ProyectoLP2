const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('hospital', {
    idhospital: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    nombre: {
      type: DataTypes.STRING(25),
      allowNull: true
    },
    url: {
      type: DataTypes.STRING(75),
      allowNull: true
    },
    direccion: {
      type: DataTypes.STRING(75),
      allowNull: true
    },
    telefono: {
      type: DataTypes.STRING(15),
      allowNull: true
    },
    idusuario: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'usuario',
        key: 'idusuario'
      }
    }
  }, {
    sequelize,
    tableName: 'hospital',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "idhospital" },
        ]
      },
      {
        name: "fk_hospital_usuario_idx",
        using: "BTREE",
        fields: [
          { name: "idusuario" },
        ]
      },
    ]
  });
};
