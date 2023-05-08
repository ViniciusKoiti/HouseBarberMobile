import 'package:flutter/material.dart';
import 'package:housebarber/Components/appBar/bottomNavBar.dart';
import 'package:housebarber/Models/Cliente.dart';
import 'package:housebarber/Models/avaliacao.dart';
import 'package:housebarber/Pages/Avaliacao/servicosRealizados.dart';

class TelaListaClientes extends StatefulWidget {
  const TelaListaClientes({Key? key}) : super(key: key);

  @override
  _TelaListaClientesState createState() => _TelaListaClientesState();
}

class _TelaListaClientesState extends State<TelaListaClientes> {
  List<Cliente> clientes = [
    Cliente(
      nome: "João",
      telefone: "(11) 99999-9999",
      avaliacoes: [
        Avaliacao(
          nota: 5,
          comentario: "Ótimo atendimento!",
          data: DateTime(2022, 1, 1),
        ),
        Avaliacao(
          nota: 4,
          comentario: "Preço um pouco alto",
          data: DateTime(2022, 2, 1),
        ),
      ],
    ),
    Cliente(
      nome: "Maria",
      telefone: "(11) 88888-8888",
      avaliacoes: [
        Avaliacao(
          nota: 3,
          comentario: "Demorou um pouco",
          data: DateTime(2022, 3, 1),
        ),
        Avaliacao(
          nota: 5,
          comentario: "Excelente profissional",
          data: DateTime(2022, 4, 1),
        ),
      ],
    ),
  ];

  List<Cliente> _clientesFiltrados = [];

  final TextEditingController _controladorBusca = TextEditingController();

  @override
  void initState() {
    super.initState();
    _clientesFiltrados = clientes;
    _controladorBusca.addListener(_atualizarBusca);
  }

  void _atualizarBusca() {
    final String textoBusca = _controladorBusca.text.toLowerCase();
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
