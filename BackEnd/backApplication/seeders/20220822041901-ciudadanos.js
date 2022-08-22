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
     await queryInterface.bulkInsert('Ciudadano', [{
      idciudadano:1,
      nombre:'Adriel Robles',
      telefono:'1234567891',
      idusuario:1,
    },
    {
      idciudadano:2,
      nombre:'Jean Moreano',
      telefono:'1234567891',
      idusuario:2,
    },
    {
      idciudadano:3,
      nombre:'Darinka Towsend',
      telefono:'1234567891',
      idusuario:3,
    }], {});
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
     await queryInterface.bulkDelete('Ciudadano', null, {});

  }
};
