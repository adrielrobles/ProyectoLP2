import 'package:flutter/material.dart';
import '../../widgets/blue_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: /* const Color(0xffF2F2F2) */ Color.fromARGB(255, 255, 255, 255),
          body: Container(
            child: Column(
        children: [
              const SizedBox(height: 105),
            BlueButton(
              buttonText: 'Registrarse',
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'home');
              }),
              
              const SizedBox(height: 15),
              BlueButton(
              buttonText: 'Iniciar Sesion',
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'home');
              }),
            /*  TextButton(
                 style: ButtonStyle(
                 foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
               ),
                  onPressed: () { 
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                  child: const Text('Iniciar Sesion'),
                ) ,*/
          
        ],
      ),
          ),
    );
  }
}

