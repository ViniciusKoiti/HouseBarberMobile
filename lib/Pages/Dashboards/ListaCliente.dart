import 'package:flutter/material.dart';
import 'package:housebarber/Components/customAppBar.dart';
import 'package:housebarber/Models/Cliente.dart';

class TelaListaClientes extends StatefulWidget {
  const TelaListaClientes({Key? key}) : super(key: key);

  @override
  _TelaListaClientesState createState() => _TelaListaClientesState();
}

class _TelaListaClientesState extends State<TelaListaClientes> {
  final List<Cliente> _todosClientes = [
    Cliente(
        nome: 'João da Silva',
        telefone: '(11) 1234-5678',
        email: 'joao@gmail.com'),
    Cliente(
        nome: 'Maria Souza',
        telefone: '(21) 9876-5432',
        email: 'maria@gmail.com'),
    Cliente(
        nome: 'José Santos',
        telefone: '(19) 9999-9999',
        email: 'jose@gmail.com'),
  ];

  List<Cliente> _clientesFiltrados = [];

  final TextEditingController _controladorBusca = TextEditingController();

  @override
  void initState() {
    super.initState();
    _clientesFiltrados = _todosClientes;
    _controladorBusca.addListener(_atualizarBusca);
  }

  void _atualizarBusca() {
    final String textoBusca = _controladorBusca.text.toLowerCase();
    setState(() {
      _clientesFiltrados = _todosClientes
          .where((cliente) =>
              cliente.nome.toLowerCase().contains(textoBusca) ||
              cliente.telefone.toLowerCase().contains(textoBusca) ||
              cliente.email.toLowerCase().contains(textoBusca))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Clientes'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controladorBusca,
                decoration: InputDecoration(
                  hintText: 'Buscar',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _clientesFiltrados.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(_clientesFiltrados[index].nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_clientesFiltrados[index].telefone),
                        Text(_clientesFiltrados[index].email),
                      ],
                    ),
                    onTap: () {
                      // ação a ser executada ao clicar no cliente
                    },
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar());
  }
}
