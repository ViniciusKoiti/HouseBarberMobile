import 'package:flutter/material.dart';
import 'package:housebarber/Pages/Login/LoginBarbeiro.dart';
import 'package:housebarber/routes/routes.dart';

import 'Pages/Home/Home.dart';

class App extends StatelessWidget {
  //App possui um método abstrato
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Projeto Marcador de Ponto",
        routes: {
          Rotas.home: (context) => HomePage(),
          Rotas.login: (context) => LoginBarbeiro()
        },
        home: HomePage());
  }
}
