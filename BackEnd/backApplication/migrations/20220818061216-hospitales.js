'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
     await queryInterface.createTable('hospital', {
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
     await queryInterface.dropTable('hospital')
  }
};
