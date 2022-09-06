import 'package:flutter/material.dart';
import '../../widgets/blue_button.dart' as blue;
import '../../widgets/white_button.dart' as white;
//Darinka Townsend

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: /* const Color(0xffF2F2F2) */ Color
          .fromARGB(255, 255, 255, 255),
      body: Container(
        margin: const EdgeInsets.only(left: 300.0, right: 300.0),
        child: Column(
          children: [
            Image(
              image: AssetImage('../assets/welcome.jpg'),
              height: 300,
            ),
            Text(
              '¡BIENVENIDO!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 50),
            blue.BlueButton(
                buttonText: 'Registrarse',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                }),
            const SizedBox(height: 15),
            blue.BlueButton(
                buttonText: 'Iniciar Sesion',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                }),
          ],
        ),
      ),
    );
  }
}
