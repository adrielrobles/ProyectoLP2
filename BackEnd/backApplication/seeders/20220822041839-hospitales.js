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
     await queryInterface.bulkInsert('Hospital', [{
      idhospital:1,
      nombre:'Hospital Guayaquil Abel Gilbert Pontón',
      url:'https://www.salud.gob.ec/wp-content/uploads/2018/09/H-ABEL-GILBERT-PONTON.png',
      direccion:"https://www.google.com/maps/place/Hospital+Guayaquil+Abel+Gilbert+Pont%C3%B3n/@-2.1858354,-79.9451634,13z/data=!4m19!1m13!4m12!1m4!2m2!1d-79.9288784!2d-2.1594851!4e1!1m6!1m2!1s0x902d71c44ca735d3:0x3c18effbb3d3cf2f!2shospitales+Guayaquil!2m2!1d-79.9307658!2d-2.2123607!3m4!1s0x902d71c44ca735d3:0x3c18effbb3d3cf2f!8m2!3d-2.2123607!4d-79.9307658",
      telefono:'042597400',
      idusuario:4,
    },
    {
      idhospital:2,
      nombre:'Hospital Luis Vernaza de la Junta de Beneficencia de Guayaquil',
      url:'https://blobdoctorisyprdo.blob.core.windows.net/catalogs/medicalCenters/CM000005.jpg',
      direccion:"https://www.google.com/maps/dir/-2.1594851,-79.9288784/Hospital+Luis+Vernaza+de+la+Junta+de+Beneficencia+de+Guayaquil/@-2.1725059,-79.9410066,13z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x902d6dd16c021207:0x9df557b472d59f28!2m2!1d-79.8804248!2d-2.1834524",
      telefono:'042560300',
      idusuario:5,
    },
    {
      idhospital:3,
      nombre:'Hospital del Día Samuel Ratinoff',
      url:'https://scontent.fgye1-2.fna.fbcdn.net/v/t1.6435-9/72067075_10156876323759865_5010908421206048768_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=wYfsq8Tf9gQAX8czyPg&_nc_ht=scontent.fgye1-2.fna&oh=00_AT_1w2agL08hEoyNCQWGIc8WYRWAHRFURM3kuugElswsBg&oe=63297CA8',
      direccion:"https://www.google.com/maps/dir//hospitales+Guayaquil/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x902d72c8d6189e1b:0xe2d3d100ced23e3d?sa=X&ved=2ahUKEwi5883s0Nn5AhWusIQIHXJ6AjAQ9Rd6BAgGEAQ",
      telefono:'098 088 2509',
      idusuario:6,
    }], {});
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
     await queryInterface.bulkDelete('Hospital', null, {});

  }
};
