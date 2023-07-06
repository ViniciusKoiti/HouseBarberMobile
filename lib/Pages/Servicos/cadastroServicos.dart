import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:housebarber/Pages/Avaliacao/servicosRealizados.dart';
import 'package:housebarber/Pages/Perfil/PerfilBarbeiro.dart';
import 'package:housebarber/database/Models/cliente.dart';
import 'package:housebarber/database/Models/produto.dart';
import 'package:housebarber/database/Models/servico.dart';
import 'package:housebarber/database/sqlite/dao/servicoDaoSQLite.dart';

import '../../routes/routes.dart';

class CadastroServicoScreen extends StatefulWidget {
  const CadastroServicoScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CadastroServicoScreenState createState() => _CadastroServicoScreenState();
}

class _CadastroServicoScreenState extends State<CadastroServicoScreen> {
  ServicoDaoSQLite servicoDaoSQLite = ServicoDaoSQLite();
  List<Produto> produtos = List.empty();
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  dynamic idCliente;
  dynamic idServico;
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    receberServicoParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Serviço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    return 'Por favor, informe o nome do serviço';
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
                    return 'Por favor, informe a descrição do serviço';
                  }
                  return null;
                },
              ),
              DropdownButton<Produto>(
                items: list
                    .map<DropdownMenuItem<Produto>>((Produto produto) {
                      return DropdownMenuItem<Produto>(
                        value: produto,
                        child: Text(produto.nome),
                      );
                    } as DropdownMenuItem<Produto> Function(String e))
                    .toList(),
                onChanged: (Produto? value) {},
                elevation: 16,
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    servicoDaoSQLite.salvar(criarServicoDto());

                    Navigator.pushNamed(context, Rotas.listaServico,
                        arguments: idCliente);
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void receberServicoParaAlteracao(BuildContext context) async {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      if (parametro.settings.arguments is CreateServico) {
        CreateServico createServico =
            parametro.settings.arguments as CreateServico;
        idServico = createServico.idServico;
        idCliente = createServico.idCliente;
        Servico servico = await servicoDaoSQLite.getById(idServico!);
        preencherCampos(servico);
      } else {
        idCliente = parametro.settings.arguments as int?;
      }
    }
  }

  void preencherCampos(Servico servico) {
    _nomeController.text = servico.nome;
    _descricaoController.text = servico.descricao;
    _precoController.text = "${servico.preco}";
  }

  Servico criarServicoDto() {
    return Servico(
        id: idServico,
        nome: _nomeController.text,
        descricao: _descricaoController.text,
        preco: double.parse(_precoController.text),
        cliente_id: idCliente,
        produto_id: 1
        );
  }
}
