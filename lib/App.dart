import 'package:flutter/material.dart';
import 'package:housebarber/Pages/Login/LoginBarbeiro.dart';
import 'package:housebarber/Pages/Login/LoginCliente.dart';
import 'package:housebarber/routes/routes.dart';

import 'Pages/Home/Home.dart';

class App extends StatelessWidget {
  //App possui um método abstrato
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "House Barber",
        routes: {
          Rotas.home: (context) => HomePage(),
          Rotas.loginBarbeiro: (context) => LoginBarbeiro(),
          Rotas.loginCliente: (context) => LoginCliente(),
        },
        home: HomePage());
  }
}
