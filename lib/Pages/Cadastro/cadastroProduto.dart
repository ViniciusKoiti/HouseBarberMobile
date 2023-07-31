import 'package:flutter/material.dart';
import 'package:housebarber/database/Models/produto.dart';
import 'package:housebarber/database/sqlite/dao/produtoDaoSQLLite.dart';

import '../../routes/routes.dart';

class CadastroProdutoScreen extends StatefulWidget {
  const CadastroProdutoScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CadastroProdutoScreenState createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
  ProdutoDaoSQLite produtoDaoSQLite = new ProdutoDaoSQLite();
  dynamic idCliente;
  dynamic idProduto;
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();
  final _quantidadeController = TextEditingController();
  final _marcaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    receberProdutoParaAlteracao(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Produto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe o nome do produto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descricaoController,
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe a descrição do produto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _quantidadeController,
                    decoration: const InputDecoration(
                      labelText: 'Preço',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe o preço do produto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _precoController,
                    decoration: const InputDecoration(
                      labelText: 'Preço',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe o preço do serviço';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _marcaController,
                    decoration: const InputDecoration(
                      labelText: 'Preço',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe o marca do produto';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        produtoDaoSQLite.salvar(criarProdutoDto());

                        Navigator.pushNamed(context, Rotas.listaBarbeiro,
                            arguments: idCliente);
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void receberProdutoParaAlteracao(BuildContext context) async {
    var parametro = ModalRoute.of(context);
    print(parametro!.settings.arguments);
    if (parametro.settings.arguments != null) {
      if (parametro.settings.arguments is Produto) {
        Produto? produto = parametro.settings.arguments as Produto;
        preencherCampos(produto);
      } else {
        idProduto = parametro.settings.arguments as int?;

        Produto? produto = await produtoDaoSQLite.getById(idProduto!);
        print(produto.nome);
        preencherCampos(produto);
      }
    }
  }

  void preencherCampos(Produto produto) {
    _nomeController.text = produto.nome;
    _descricaoController.text = produto.descricao;
    _precoController.text = "${produto.preco}";
    _quantidadeController.text = "${produto.quantidade}";
    _marcaController.text = produto.marca;
  }

  Produto criarProdutoDto() {
    return Produto(
      id: idProduto,
      nome: _nomeController.text,
      descricao: _descricaoController.text,
      preco: double.parse(_precoController.text),
      quantidade: double.parse(_quantidadeController.text),
      marca: _marcaController.text,
    );
  }
}
