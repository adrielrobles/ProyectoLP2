Base de datos (Comando de configurar)

En el archivo config.json dentro de la carpeta BackEnd/BackApplication cambiar el username y password de la clave development de acuerdo a las credenciales de la base de datos local en el que se esté corriendo el programa.

Ejecutar los siguientes comandos:
npm install
npm install -g sequelize
sequelize db:create
sequelize db:migrate
sequelize db:seed:all

Luego correr el database 
npm run devstart


