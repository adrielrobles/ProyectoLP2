import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/usuario_Sevices.dart';
import '../../widgets/blue_button.dart' as blue;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  State<LoginPage> createState() => _InicioState();

}
  class _InicioState extends State<LoginPage> {
  @override
    

  TextEditingController? textController1;
  TextEditingController? textController2;

  void validarUsuario(){
    final data = {
      "correo":"${textController1?.text}",
      "contrasena":"${textController2?.text}",
    };
    UsuarioService().validarUsuario(data).then((value) => {if(value){_showAlertDialog()}});
  }

   void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 196, 196, 196),
          title: Text("Inicio de sesion valido!"),
          actions: <Widget>[
            FlatButton(
                          color: Color.fromARGB(255, 230, 65, 84),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Cerrar",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'home');
                          }),
          ],
        );
      }
    );
    textController1?.clear();
    textController2?.clear();
  }

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Color.fromARGB(255, 56, 83, 152),
        body: CustomPaint(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                const Padding(
                  padding: EdgeInsets.zero,
                  child: Text(
                   'Iniciar Sesión',
                       textAlign: TextAlign.center,
                        style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    children: [
                      
                      Column(
        children: <Widget> [
                         Text('Correo Electrónico:',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 18,
                              )),
                          TextFormField(
                            controller: textController1,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(104, 196, 196, 196),
                            ),
                          ),
                          Text('Contraseña:',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 18,
                              )),
                          TextFormField(
                            controller: textController2,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(104, 196, 196, 196),
                            ),
                          ),

          const SizedBox(height: 10),

          const SizedBox(height: 30),
          blue.BlueButton(
                buttonText: 'Iniciar Sesion',
                onPressed: () {
                  validarUsuario();
                }),
        ]
      ),
                     
                    ],
                  )
                ),
              ],
            )
          )
        )
      )
    );
  }


  }