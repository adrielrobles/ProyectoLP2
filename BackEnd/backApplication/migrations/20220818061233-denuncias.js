'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
     await queryInterface.createTable('denuncia', {
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
        onDelete:"CASCADE",
        onUpdate:"CASCADE"
      }
    },);
  },

  down: async (queryInterface, Sequelize) => {

    /**
     * 
     * 
     * Add reverting commands here.
     *
     * Example:
     * await queryInterface.dropTable('users');
     */
     await queryInterface.dropTable('denuncia')
  }
};
