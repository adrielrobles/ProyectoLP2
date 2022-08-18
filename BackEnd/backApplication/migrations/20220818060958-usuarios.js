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
