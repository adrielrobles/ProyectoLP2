import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';
import '../pages/login/login.dart';
import '../pages/register/register.dart';
import '../pages/welcome/welcome.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomePage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'welcome': (_) => const WelcomePage(),
};
