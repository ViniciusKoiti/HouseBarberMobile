import 'package:flutter/material.dart';
import 'package:housebarber/Components/appBar/bottomNavBar.dart';
import 'package:housebarber/database/Models/produto.dart';
import 'package:housebarber/database/sqlite/dao/produtoDaoSQLLite.dart';
import 'package:housebarber/routes/routes.dart';

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({Key? key}) : super(key: key);

  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  List<Produto> _produtoFiltrados = [];
  ProdutoDaoSQLite produtoDao = ProdutoDaoSQLite();

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
    List<Produto> produtos = await produtoDao.listarTodos();
    setState(() {
      _produtoFiltrados = produtos
          .where((produto) =>
              produto.nome.toLowerCase().contains(textoBusca) ||
              produto.marca.toLowerCase().contains(textoBusca))
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
                itemCount: _produtoFiltrados.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_produtoFiltrados[index].nome),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              await produtoDao
                                  .excluir(_produtoFiltrados[index].id);
                              _atualizarBusca();
                            },
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Rotas.cadastroProduto,
                                  arguments: _produtoFiltrados[index]);
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
                        Text(_produtoFiltrados[index].marca),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Rotas.cadastroProduto,
                          arguments: _produtoFiltrados[index].id);
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
