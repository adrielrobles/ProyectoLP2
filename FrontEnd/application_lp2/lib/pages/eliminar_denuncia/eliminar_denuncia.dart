import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Confirmación para eliminar"),
        ),
        body: TextButton(
          onPressed: () {
            print("Button pressed");
          },
          child: Text("TEXT BUTTON"),
        ));
  }
}
