import 'package:flutter/material.dart';
import 'package:housebarber/Pages/Avaliacao/servicosRealizados.dart';
import 'package:housebarber/database/Models/servico.dart';
import 'package:housebarber/database/sqlite/dao/produtoDaoSQLLite.dart';
import 'package:housebarber/database/sqlite/dao/servicoDaoSQLite.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../database/Models/produto.dart';
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
  ProdutoDaoSQLite produtoDaoSQLite = ProdutoDaoSQLite();
  dynamic idCliente;
  dynamic idServico;
  List<Produto> _produtos = [];
  List<Produto> _selectedProdutos = [];
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
              MultiSelectDialogField<Produto>(
                items: _produtos.map((produto) {
                  return MultiSelectItem<Produto>(
                    produto,
                    produto.nome,
                  );
                }).toList(),
                title: Text('Selecione os produtos para o serviço'),
                initialValue: _selectedProdutos,
                onConfirm: (List<Produto> selected) {
                  setState(() {
                    _selectedProdutos = selected;
                  });
                },
              ),
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Servico servico =
                        await servicoDaoSQLite.salvar(criarServicoDto());
                    if (!_produtos.isEmpty) {
                      for (Produto produto in _produtos) {
                        produtoDaoSQLite.salvarServicoProduto(
                            servico.id, produto.id);
                      }
                    }
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
        ProdutoDaoSQLite produtoDaoSQLite = ProdutoDaoSQLite();
        CreateServico createServico =
            parametro.settings.arguments as CreateServico;
        idServico = createServico.idServico;
        idCliente = createServico.idCliente;

        List<Produto> produtos =
            await produtoDaoSQLite.findProdutoByServico(idServico);
        Servico servico = await servicoDaoSQLite.getById(idServico!);
        print(produtos);
        preencherCampos(servico, produtos: produtos);
      } else {
        idCliente = parametro.settings.arguments as int?;
      }
    }
  }

  void preencherCampos(Servico servico, {List<Produto> produtos = const []}) {
    _nomeController.text = servico.nome;
    _descricaoController.text = servico.descricao;
    _precoController.text = "${servico.preco}";

    _selectedProdutos = produtos;
  }

  Servico criarServicoDto() {
    return Servico(
        id: idServico,
        nome: _nomeController.text,
        descricao: _descricaoController.text,
        preco: double.parse(_precoController.text),
        cliente_id: idCliente);
  }

  @override
  void initState() {
    super.initState();
    _loadProdutosFromDatabase();
  }

  Future<void> _loadProdutosFromDatabase() async {
    ProdutoDaoSQLite produtoDaoSQLite = ProdutoDaoSQLite();
    List<Produto> produtos = await produtoDaoSQLite.listarTodos();

    setState(() {
      _produtos = produtos;
    });
  }
}
