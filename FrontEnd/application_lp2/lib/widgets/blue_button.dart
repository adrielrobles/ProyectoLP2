import 'package:flutter/material.dart';

//Todos
class BlueButton extends StatelessWidget {
  const BlueButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 56, 83, 152)),
        shape: MaterialStateProperty.all(const StadiumBorder()),
        elevation: MaterialStateProperty.all(2),
      ),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
