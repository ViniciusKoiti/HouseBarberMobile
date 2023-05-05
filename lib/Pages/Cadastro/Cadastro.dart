import 'package:flutter/material.dart';
import 'package:housebarber/Components/ButtonConfirm.dart';
import 'package:housebarber/Components/InlineFields.dart';
import 'package:housebarber/Components/TextFieldWithText.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final loginController = TextEditingController();
  final cpfCnpjController = TextEditingController();
  final dataController = TextEditingController();
  final cepController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmaSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    children: [
                      TextFieldWithText(
                        title: "Login",
                        controller: loginController,
                      ),
                      TextFieldWithText(
                        title: "CPF ou CNPJ",
                        controller: cpfCnpjController,
                      ),
                      ResponsiveInlineFields(
                        title1: "Data",
                        field1: TextField(
                          controller: dataController,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                            labelText: "Data",
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        title2: "CEP",
                        field2: TextField(
                          controller: cepController,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                            labelText: "CEP",
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        flex1: 1,
                        flex2: 3,
                      ),
                      TextFieldWithText(
                        title: "Senha",
                        controller: senhaController,
                      ),
                      TextFieldWithText(
                        title: "Confirme sua senha",
                        controller: confirmaSenhaController,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      ButtonConfirm(
                        title: "Registrar-se",
                        onPressed: () => {print("Teste")},
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
