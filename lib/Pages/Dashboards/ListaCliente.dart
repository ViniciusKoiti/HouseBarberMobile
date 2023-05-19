import 'package:flutter/material.dart';
import 'package:housebarber/Components/appBar/bottomNavBar.dart';
import 'package:housebarber/database/Models/cliente.dart';
import 'package:housebarber/database/Models/avaliacao.dart';
import 'package:housebarber/Pages/Avaliacao/servicosRealizados.dart';
import 'package:housebarber/database/fake/clienteDao.dart';

import '../../database/genericDao.dart';

class TelaListaClientes extends StatefulWidget {
  const TelaListaClientes({Key? key}) : super(key: key);

  @override
  _TelaListaClientesState createState() => _TelaListaClientesState();
}

class _TelaListaClientesState extends State<TelaListaClientes> {
  

  List<Cliente> _clientesFiltrados = [];

  final TextEditingController _controladorBusca = TextEditingController();

  @override
  void initState() {
    super.initState();
    ClienteDao dao = ClienteDao();
    _controladorBusca.addListener(_atualizarBusca);
  }

  void _atualizarBusca() {
    final String textoBusca = _controladorBusca.text.toLowerCase();[
    setState(() {
      ClienteDao dao = ClienteDao();
      List<Cliente> clientes = dao.listarTodos() as List<Cliente>;
      _clientesFiltrados = clientes
          .where((cliente) =>
              cliente.nome.toLowerCase().contains(textoBusca) ||
              cliente.telefone.toLowerCase().contains(textoBusca))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controladorBusca,
                decoration: const InputDecoration(
                  hintText: 'Buscar',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _clientesFiltrados.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(_clientesFiltrados[index].nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_clientesFiltrados[index].telefone),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ServicosRealizadosPage()),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar());
  }
}
