import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/Components/Buttons/ButtonConfirm.dart';
import 'package:housebarber/Components/InlineFields.dart';
import 'package:housebarber/Components/fields/TextFieldWithText.dart';
import 'package:housebarber/Components/text/titleText.dart';
import 'package:housebarber/Pages/Dashboards/ListaBarbeiros.dart';
import 'package:housebarber/Pages/Login/LoginBarbeiro.dart';

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
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleText(
                    title: "Cadastre-se",
                    color: Colors.black12,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                    width: MediaQuery.of(context).size.width *
                        0.8, // 80% da largura da tela
                  ),
                  const Text("Preencha os campos abaixo"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.01, // 10% da altura da tela
                    width: MediaQuery.of(context).size.width *
                        0.8, // 80% da largura da tela
                  ),
                  TextFieldWithText(
                      title: "CPF ou CNPJ",
                      controller: cpfCnpjController,
                      icon: const Icon(Icons.edit_document)),
                  ResponsiveInlineFields(
                      field1: TextFieldWithText(
                          title: "Senha",
                          controller: senhaController,
                          icon: const Icon(Icons.password_rounded)),
                      field2: TextFieldWithText(
                          title: "Confirma senha",
                          controller: confirmaSenhaController,
                          icon: const Icon(Icons.password))),
                  TextFieldWithText(
                      title: "Email",
                      controller: emailController,
                      icon: const Icon(Icons.email)),
                  ResponsiveInlineFields(
                    field1: TextFieldWithText(
                        title: "Data de Nascimento",
                        controller: dataController,
                        icon: const Icon(Icons.date_range)),
                    field2: TextFieldWithText(
                        title: "CEP",
                        controller: cepController,
                        icon: const Icon(Icons.post_add_rounded)),
                  ),
                  ButtonConfirm(
                      title: "Registre-se",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Agenda()),
                        );
                      },
                      color: Colors.blue),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.01, // 10% da altura da tela
                    width: MediaQuery.of(context).size.width *
                        0.8, // 80% da largura da tela
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Já possui uma conta? ',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Clique aqui',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginBarbeiro()),
                              );
                            },
                        ),
                        const TextSpan(
                          text: ' para acessar o login',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
