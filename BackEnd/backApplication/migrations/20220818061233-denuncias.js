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
        autoIncrement: true,
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true
      },
      titulo: {
        type: Sequelize.STRING(50),
        allowNull: true
      },
      descripcion: {
        type: Sequelize.STRING(350),
        allowNull: true
      },
      num_Apoyos: {
        type: Sequelize.INTEGER,
        allowNull: true
      },
      fechaDenuncia: {
        type: Sequelize.DATE,
        allowNull: true
      },
      idciudadano: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'ciudadano',
          key: 'idciudadano'
        }
      },
      idhospital: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'hospital',
          key: 'idhospital'
        }
      },
      idestado: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'estado',
          key: 'idestado'
        },
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
