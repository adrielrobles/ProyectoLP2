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
     await queryInterface.bulkInsert('Usuario', [{
      idusuario:1,
      correo: 'adriel@espol.edu.ec',
      contrasena: '123',
    },
    {
      idusuario:2,
      correo: 'moreano@espol.edu.ec',
      contrasena: '123',
    },
    {
      idusuario:3,
      correo: 'darinka@espol.edu.ec',
      contrasena: '123',
    },
    {
      idusuario:4,
      correo: 'hospital4@espol.edu.ec',
      contrasena: '123',
    },
    {
      idusuario:5,
      correo: 'hospital5@espol.edu.ec',
      contrasena: '123',
    },
    {
      idusuario:6,
      correo: 'hospital6@espol.edu.ec',
      contrasena: '123',
    }
  ], {});
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
     await queryInterface.bulkDelete('Usuario', null, {});
  }
};
