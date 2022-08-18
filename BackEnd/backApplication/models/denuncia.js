const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('denuncia', {
    iddenuncia: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    titulo: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    descripcion: {
      type: DataTypes.STRING(150),
      allowNull: true
    },
    num_Apoyos: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    idciudadano: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'ciudadano',
        key: 'idciudadano'
      }
    },
    idhospital: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'hospital',
        key: 'idhospital'
      }
    },
    idestado: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'estado',
        key: 'idestado'
      }
    }
  }, {
    sequelize,
    tableName: 'denuncia',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "iddenuncia" },
        ]
      },
      {
        name: "fk_denuncia_ciudadano_idx",
        using: "BTREE",
        fields: [
          { name: "idciudadano" },
        ]
      },
      {
        name: "fk_denuncia_hospital_idx",
        using: "BTREE",
        fields: [
          { name: "idhospital" },
        ]
      },
      {
        name: "fk_denuncia_estado_idx",
        using: "BTREE",
        fields: [
          { name: "idestado" },
        ]
      },
    ]
  });
};
