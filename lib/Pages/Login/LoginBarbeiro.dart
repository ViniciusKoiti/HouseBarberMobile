import 'package:flutter/material.dart';
import 'package:housebarber/Components/Buttons/ButtonConfirm.dart';
import 'package:housebarber/Components/Buttons/ButtonFacebook.dart';
import 'package:housebarber/Components/Buttons/ButtonGoogle.dart';
import 'package:housebarber/Components/containerCentral.dart';
import 'package:housebarber/Pages/Cadastro/Cadastro.dart';
import 'package:housebarber/Pages/Dashboards/Agendamento.dart';

import '../../Components/fields/TextFieldWithText.dart';

class LoginBarbeiro extends StatelessWidget {
  LoginBarbeiro({super.key});
  List<String> barbearias = ["barbearia 1", "barbearia 2"];

  // Criando os TextEditingController para os campos de texto
  final cpfController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth / 2;
    var loginWithGoogle;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ContainerCentral(
            widgets: [
              TextFieldWithText(
                  icon: const Icon(Icons.document_scanner_rounded),
                  title: "CPF ou CNPJ",
                  controller: cpfController),
              TextFieldWithText(
                  icon: const Icon(Icons.password_outlined),
                  title: "Senha",
                  controller: senhaController),
              ButtonConfirm(
                title: "Fazer login",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AgendamentoScreen()),
                  );
                },
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cadastro()),
                  );
                },
                child: null,
              ),
              const SizedBox(
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
