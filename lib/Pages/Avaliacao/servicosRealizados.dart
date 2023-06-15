import 'package:flutter/material.dart';
import 'package:housebarber/database/Models/cliente.dart';
import 'package:housebarber/database/Models/servico.dart';
import 'package:housebarber/database/sqlite/conectDatabase.dart';
import 'package:housebarber/database/sqlite/servicoDaoSQLite.dart';
import 'package:sqflite/sqflite.dart';

class ServicosRealizado extends StatefulWidget {
  const ServicosRealizado({super.key});

  @override
  State<ServicosRealizado> createState() => _ServicosRealizadosPage();
}

class _ServicosRealizadosPage extends State<ServicosRealizado> {
  ServicoDao servicoDao = ServicoDao();
  List<Servico> listaServicos = [];
  dynamic id;

  @override
  Widget build(BuildContext context) {
    listaServicosPorCliente(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços Realizados'),
      ),
      body: ListView.builder(
        itemCount: listaServicos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              trailing: const Icon(Icons.check_circle_outline_rounded),
              title: Text('Serviço ${index + 1}'),
              subtitle: const Text(
                  'Barbeiro: João Silva\nData: 01/05/2022\nPreço: R\$ 50,00'),
            ),
          );
        },
      ),
    );
  }

  void listaServicosPorCliente(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Cliente cliente = parametro.settings.arguments as Cliente;
      id = cliente.id;
    }
    this.listaServicos =
        servicoDao.listarServicosPorClienteId(id) as List<Servico>;
  }
}
