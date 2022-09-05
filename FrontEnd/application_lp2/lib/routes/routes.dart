import 'package:flutter/material.dart';
import 'package:proyectolenguajes/pages/verHospitales/verHospitales.dart';
import '../pages/crearDenuncia/crearDenuncia.dart';
import '../pages/denuncias/mostrarDenuncias.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login.dart';
import '../pages/register/register.dart';
import '../pages/welcome/welcome.dart';
import '../pages/eliminar/eliminar.dart';
import '../pages/verDenuncia/verDenuncia.dart';
import '../pages/verDenuncia/ubicacion.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomePage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'welcome': (_) => const WelcomePage(),
  'verHospitales': (_) => const VerHospitalesPage(),
  'eliminar': (_) => Eliminar(),
  'crearDenuncia': (_) => const CrearDenunciaPage(idhospital: "1"),
  'VerDenuncia': (_) => const VerDenunciaEspecificaPage(),
  'mostrarDenuncia': (_) => const MostrarDenuncias(),
  'ubicacion': (_) => const ubicacionApp(),
};
