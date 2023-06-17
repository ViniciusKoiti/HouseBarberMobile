import 'package:flutter/material.dart';
import 'package:housebarber/database/Models/cliente.dart';
import 'package:housebarber/database/Models/servico.dart';
import 'package:housebarber/database/sqlite/servicoDaoSQLite.dart';
import 'package:housebarber/routes/routes.dart';

class ServicosRealizado extends StatefulWidget {
  const ServicosRealizado({super.key});

  @override
  State<ServicosRealizado> createState() => _ServicosRealizadosPage();
}

class CreateServico {
  final String idCliente;
  String? idServico;

  CreateServico(this.idCliente, this.idServico);
}

class _ServicosRealizadosPage extends State<ServicosRealizado> {
  ServicoDaoSQLite servicoDao = ServicoDaoSQLite();
  List<Servico> listaServicos = [];
  dynamic idCliente;
  dynamic idServico;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Serviços Realizados'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.plus_one,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Rotas.cadastroServico,
                    arguments: CreateServico(idCliente, null));
              },
            )
          ],
        ),
        body: criarLista(context));
  }

  void listaServicosPorCliente(BuildContext context) async {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Cliente cliente = parametro.settings.arguments as Cliente;
      idCliente = cliente.id;
    }
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
        future: buscarServicosPorCliente(),
        builder: (BuildContext context, AsyncSnapshot<List<Servico>> lista) {
          if (!lista.hasData) return const CircularProgressIndicator();
          if (lista.data == null) return const Text('Não há Servico...');
          List<Servico> listaServico = lista.data!;
          return ListView.builder(
              itemCount: listaServico.length,
              itemBuilder: (context, indice) {
                var servico = listaServico[indice];
                return criarItemLista(context, servico);
              });
        });
  }

  Widget criarItemLista(BuildContext context, Servico servico) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        trailing: const Icon(Icons.check_circle_outline_rounded),
        title: Text(servico.nome),
        subtitle: Text("${servico.preco}"),
      ),
    );
  }

  Future<List<Servico>> buscarServicosPorCliente() {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Cliente cliente = parametro.settings.arguments as Cliente;
      idCliente = cliente.id;
    }
    setState(() {});
    return servicoDao.listarServicosPorClienteId(idCliente);
  }
}
