var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors = require('cors');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var usuarioRouter = require('./routes/usuario');
var ciudadanoRouter = require('./routes/ciudadano');
var hospitalRouter = require('./routes/hospital');
var denunciaRouter = require('./routes/denuncia');
var estadoRouter = require('./routes/estado');
var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(cors());

app.use('/', indexRouter);
app.use('/usuario', usuarioRouter);
app.use('/ciudadano', ciudadanoRouter);
app.use('/hospital', hospitalRouter);
app.use('/denuncia', denunciaRouter);
app.use('/estado', estadoRouter);

module.exports = app;
