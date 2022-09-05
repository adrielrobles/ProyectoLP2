import 'package:flutter/material.dart';
import 'package:proyectolenguajes/pages/verHospitales/verHospitales.dart';

import '../pages/home/home_page.dart';
import '../pages/login/login.dart';
import '../pages/register/register.dart';
import '../pages/welcome/welcome.dart';
import '../pages/eliminar/eliminar.dart';
import '../pages/crearDenuncia/crearDenuncia.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomePage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'welcome': (_) => const WelcomePage(),
  'verHospitales': (_) => const VerHospitalesPage(),
  'eliminar': (_) => Eliminar(),
};
