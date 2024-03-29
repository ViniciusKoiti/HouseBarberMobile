import 'package:flutter/material.dart';
import 'package:housebarber/Components/configs.dart';
import 'package:housebarber/Pages/Avaliacao/servicosRealizados.dart';
import 'package:housebarber/Pages/Cadastro/Cadastro.dart';
import 'package:housebarber/Pages/Cadastro/cadastroProduto.dart';
import 'package:housebarber/Pages/Dashboards/Agendamento.dart';
import 'package:housebarber/Pages/Dashboards/ListaCliente.dart';
import 'package:housebarber/Pages/Dashboards/listaProdutos.dart';
import 'package:housebarber/Pages/Login/LoginBarbeiro.dart';
import 'package:housebarber/Pages/Perfil/HistoricoDeAvalia%C3%A7%C3%B5es.dart';
import 'package:housebarber/Pages/Perfil/Notificacoes.dart';
import 'package:housebarber/Pages/Perfil/PerfilBarbeiro.dart';
import 'package:housebarber/Pages/Servicos/cadastroServicos.dart';
import 'package:housebarber/routes/routes.dart';

import 'Pages/Home/Home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "House Barber",
        routes: {
          Rotas.home: (context) => const HomePage(),
          Rotas.loginBarbeiro: (context) => LoginBarbeiro(),
          Rotas.cadastro: (context) => const Cadastro(),
          Rotas.configuracoes: (context) => const Configs(),
          Rotas.listaBarbeiro: (context) => const AgendamentoScreen(),
          Rotas.listaCliente: (context) => const TelaListaClientes(),
          Rotas.perfilBarbeiro: (context) => const BarberProfilePage(),
          Rotas.listaServico: (context) => const ServicosRealizado(),
          Rotas.listaProduto: (context) => const CadastroProdutoScreen(),
          Rotas.historicoBarbeiro: (context) => HistoricoBarbeiros(),
          Rotas.notificacoes: (context) => const Notificacoes(),
          Rotas.cadastroServico: (context) => const CadastroServicoScreen(),
          Rotas.listaProduto: (context) => const ListaProdutos(),
          Rotas.cadastroProduto: (context) => const CadastroProdutoScreen()
        },
        home: const AgendamentoScreen());
  }
}
