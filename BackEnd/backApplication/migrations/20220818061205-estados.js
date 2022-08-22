'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
     await queryInterface.createTable('estado', {
      idestado: {
        autoIncrement: true,
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true
      },
      nom_estado: {
        type: Sequelize.STRING(20),
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
     await queryInterface.dropTable('estado')
  }
};
