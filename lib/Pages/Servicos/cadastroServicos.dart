import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:housebarber/database/Models/cliente.dart';
import 'package:housebarber/database/Models/servico.dart';

class CadastroServicoScreen extends StatefulWidget {
  const CadastroServicoScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CadastroServicoScreenState createState() => _CadastroServicoScreenState();
}

class _CadastroServicoScreenState extends State<CadastroServicoScreen> {
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
                    final novoServico = Servico(
                      id: null,
                      nome: _nomeController.text,
                      descricao: _descricaoController.text,
                      preco: double.parse(_precoController.text),
                      cliente_id: idCliente,
                    );

                    Navigator.pop(context);
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

  void receberServicoParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Servico servico = parametro.settings.arguments as Servico;
      idServico = servico.id;
      preencherCampos(servico);
    }
  }

  void preencherCampos(Servico servico){
    _nomeController.text = servico.nome;
    _descricaoController.text = servico.descricao;
    _precoController.text = "${servico.preco}";
  }
}
