import 'package:flutter/material.dart';
import 'package:housebarber/Components/configs.dart';
import 'package:housebarber/Pages/Cadastro/Cadastro.dart';
import 'package:housebarber/Pages/Dashboards/ListaBarbeiros.dart';
import 'package:housebarber/Pages/Dashboards/ListaCliente.dart';
import 'package:housebarber/Pages/Home/Logo.dart';
import 'package:housebarber/Pages/Login/LoginBarbeiro.dart';
import 'package:housebarber/Pages/Login/LoginCliente.dart';
import 'package:housebarber/Pages/Perfil/HistoricoDeAvalia%C3%A7%C3%B5es.dart';
import 'package:housebarber/Pages/Perfil/Notificacoes.dart';
import 'package:housebarber/Pages/Perfil/PerfilBarbeiro.dart';
import 'package:housebarber/routes/routes.dart';

import 'Pages/Home/Home.dart';

class App extends StatelessWidget {
  const App({super.key});

  //App possui um método abstrato
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "House Barber",
        routes: {
          Rotas.home: (context) => const HomePage(),
          Rotas.loginBarbeiro: (context) => LoginBarbeiro(),
          Rotas.loginCliente: (context) => LoginCliente(),
          Rotas.cadastro: (context) => const Cadastro(),
          Rotas.configuracoes: (context) => const Configs(),
          Rotas.listaBarbeiro: (context) => const ListaBarbeiro(),
          Rotas.listaCliente: (context) => const TelaListaClientes(),
          Rotas.perfilBarbeiro: (context) => BarberProfilePage(),
          Rotas.historicoBarbeiro: (context) => HistoricoBarbeiros(),
          Rotas.notificacoes: (context) => const Notificacoes(),
        },
        home: const SplashScreen());
  }
}
