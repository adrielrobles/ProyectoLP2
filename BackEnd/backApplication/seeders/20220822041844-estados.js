'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    /**
     * Add seed commands here.
     *
     * Example:
     * await queryInterface.bulkInsert('People', [{
     *   name: 'John Doe',
     *   isBetaMember: false
     * }], {});
    */
     await queryInterface.bulkInsert('Estado', [{
      idestado:1,
      nom_estado: 'Sin Procesar',
    },
    {
      idestado:2,
      nom_estado: 'En Proceso',
    },
    {
      idestado:3,
      nom_estado: 'Resuelto',
    }], {});
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
     await queryInterface.bulkDelete('Estado', null, {});

  }
};
