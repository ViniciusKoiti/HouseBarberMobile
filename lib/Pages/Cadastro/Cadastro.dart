import 'package:flutter/material.dart';
import 'package:housebarber/Components/ButtonConfirm.dart';
import 'package:housebarber/Components/Container.dart';
import 'package:housebarber/Components/TextFieldWithText.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ContainerCentral(widgets: [
        TextFieldWithText(title: "Login"),
        TextFieldWithText(title: "Senha"),
        ButtonConfirm(
          title: "Fazer login",
          onPressed: () => {print("Teste")},
          color: Colors.black,
        ),
      ])
    ])));
  }
}
