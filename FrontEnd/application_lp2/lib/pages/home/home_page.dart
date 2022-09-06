import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              image: AssetImage('../assets/casa.png'),
              height: 200,
            ),
            Text(
              '¿Qué deseas hacer hoy?',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 56, 83, 152)),
                    width: 130,
                    height: 130,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image(
                            image: AssetImage('../assets/mis_denuncias.png'),
                            height: 50),
                        const SizedBox(height: 3),
                        Text(
                          'Denuncias',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'todas');
                  },
                ),
                const SizedBox(width: 20),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromRGBO(230, 65, 85, 1)),
                    width: 130,
                    height: 130,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image(
                            image: AssetImage('../assets/hospital.png'),
                            height: 50),
                        const SizedBox(height: 3),
                        Text(
                          'Hospitales',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'verHospitales');
                  },
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromRGBO(230, 65, 85, 1)),
                    width: 130,
                    height: 130,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image(
                            image: AssetImage('../assets/crear.png'),
                            height: 50),
                        const SizedBox(height: 3),
                        Text(
                          'Crear Denuncia',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'crearDenuncia');
                  },
                ),
                const SizedBox(width: 20),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 56, 83, 152)),
                    width: 130,
                    height: 130,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image(
                            image: AssetImage('../assets/perfil.png'),
                            height: 50),
                        const SizedBox(height: 3),
                        Text(
                          'Mi Denuncias',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'mostrarDenuncia');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
