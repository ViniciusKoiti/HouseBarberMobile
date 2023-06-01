import 'package:flutter/material.dart';
import 'package:housebarber/Components/appBar/bottomNavBar.dart';
import 'package:housebarber/Pages/Avaliacao/servicosRealizados.dart';
import 'package:housebarber/database/Models/cliente.dart';
import 'package:housebarber/database/sqlite/clienteDaoSQLLite.dart';
import 'package:housebarber/routes/routes.dart';

class TelaListaClientes extends StatefulWidget {
  const TelaListaClientes({Key? key}) : super(key: key);

  @override
  _TelaListaClientesState createState() => _TelaListaClientesState();
}

class _TelaListaClientesState extends State<TelaListaClientes> {
  List<Cliente> _clientesFiltrados = [];
  ClienteDaoSQLite clienteDao = ClienteDaoSQLite();

  final TextEditingController _controladorBusca = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controladorBusca.addListener(_atualizarBusca);
    _atualizarBusca();
  }

  void _atualizarBusca() {
    final String textoBusca = _controladorBusca.text.toLowerCase();
    _buscarClientes(textoBusca);
  }

  Future<void> _buscarClientes(String textoBusca) async {
    List<Cliente> clientes = await clienteDao.listarTodos();
    setState(() {
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
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rotas.perfilBarbeiro);
                        },
                        icon: const CircleAvatar(child: Icon(Icons.person_2))),
                    title: Text(_clientesFiltrados[index].nome),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Rotas.cadastro,
                                  arguments: _clientesFiltrados[index]);
                            },
                            icon: const Icon(Icons.edit),
                            color: Colors.blue[200],
                          )
                        ],
                      ),
                    ),
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
