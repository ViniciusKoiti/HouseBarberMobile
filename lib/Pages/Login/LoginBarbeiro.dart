import 'package:flutter/material.dart';
import 'package:housebarber/Components/ButtonConfirm.dart';
import 'package:housebarber/Components/ButtonFacebook.dart';
import 'package:housebarber/Components/ButtonGoogle.dart';
import 'package:housebarber/Components/Container.dart';
import 'package:housebarber/Components/DropdownButtonCity.dart';

import '../../Components/TextFieldWithText.dart';

class LoginBarbeiro extends StatelessWidget {
  List<String> barbearias = ["barbearia 1", "barbearia 2"];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth / 2;
    var _loginWithGoogle;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Barbeiro'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginBarbeiro()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Próxima Página',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ContainerCentral(
            widgets: [
              TextFieldWithText(title: "CPF"),
              ResponsiveDropDownButtonBarber(),
              TextFieldWithText(title: "Senha"),
              ButtonConfirm(
                title: "Fazer login",
                onPressed: () => {print("Teste")},
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              ButtonConfirm(
                  title: "Registre-se",
                  onPressed: () {},
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
