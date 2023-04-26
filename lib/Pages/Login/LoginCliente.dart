import 'package:flutter/material.dart';
import 'package:housebarber/Components/ButtonConfirm.dart';
import 'package:housebarber/Components/ButtonFacebook.dart';
import 'package:housebarber/Components/ButtonGoogle.dart';
import 'package:housebarber/Components/Container.dart';
import 'package:housebarber/Pages/Cadastro/Cadastro.dart';

import '../../Components/TextFieldWithText.dart';

class LoginCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth / 1.5;
    var _loginWithGoogle;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ContainerCentral(
            widgets: [
              TextFieldWithText(title: "CPF"),
              TextFieldWithText(title: "Senha"),
              ButtonConfirm(
                title: "Fazer login",
                onPressed: () => {print("teste")},
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              ButtonConfirm(
                  title: "Registre-se",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro()),
                    );
                  },
                  color: Colors.blue.shade700),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: Container(
                      child: ButtonGoogle(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ButtonFacebook(),
                    ),
                  )
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
