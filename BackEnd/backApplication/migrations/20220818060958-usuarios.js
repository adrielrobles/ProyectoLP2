'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
     await queryInterface.createTable('usuario', {
      idusuario: {
        autoIncrement: true,
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true
      },
      correo: {
        type: Sequelize.STRING(50),
        allowNull: false
      },
      contrasena: {
        type: Sequelize.STRING(40),
        allowNull: false
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
     await queryInterface.dropTable('usuario')
  }
};
