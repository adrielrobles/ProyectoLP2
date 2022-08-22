'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
     await queryInterface.createTable('ciudadano', {
      idciudadano: {
        autoIncrement: true,
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true
      },
      nombre: {
        type: Sequelize.STRING(30),
        allowNull: true
      },
      telefono: {
        type: Sequelize.STRING(15),
        allowNull: true
      },
      idusuario: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'usuario',
          key: 'idusuario'
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
     await queryInterface.dropTable('ciudadano')
  }
};
