import 'package:flutter/material.dart';
import './routes/routes.dart';

//Todos
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consultas App',
      initialRoute: 'welcome',
      routes: appRoutes,
    );
  }
}
