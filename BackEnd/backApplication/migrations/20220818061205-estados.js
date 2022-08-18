'use strict';

module.exports = {
  aup: async (queryInterface, Sequelize) => {
    
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
     await queryInterface.createTable('estado', {
      idestado: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true
      },
      nom_estado: {
        type: DataTypes.STRING(20),
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
