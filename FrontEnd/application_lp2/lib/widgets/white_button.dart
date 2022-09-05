import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(width: 3, color: Color.fromARGB(255, 56, 83, 152)),
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 17,
              color: Color.fromARGB(255, 56, 83, 152),
            ),
          ),
        ),
      ),
    );
  }
}
