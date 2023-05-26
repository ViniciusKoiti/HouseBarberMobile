import 'dart:async';

import 'package:housebarber/database/genericDao.dart';

import '../Models/servico.dart';

class ServicoDao extends GenericDao<Servico> {
  List<Servico> listaServicos = [
    const Servico(
      id: 1,
      nome: 'Serviço 1',
      descricao: 'Descrição do serviço 1',
      preco: 10.0,
    ),
    const Servico(
      id: 2,
      nome: 'Serviço 2',
      descricao: 'Descrição do serviço 2',
      preco: 20.0,
    ),
    const Servico(
      id: 3,
      nome: 'Serviço 3',
      descricao: 'Descrição do serviço 3',
      preco: 30.0,
    ),
  ];

  @override
  Future<bool> excluir(dynamic id) {
    listaServicos.remove(listaServicos[id - 1]);
    return Future.value( true);
  }

  @override
  Future<Servico> getById(dynamic id) {
    return Future.value(listaServicos[id - 1]);
  }

  @override
  Future<List<Servico>> listarTodos() {
    return Future.value(listaServicos);
  }

  @override
  Future<Servico> salvar(Servico servico) {
    if (servico.id == null) {
      servico = Servico(
        id: listaServicos.length,
        nome: servico.nome,
        descricao: servico.descricao,
        preco: servico.preco,
      );
      listaServicos.add(servico);
    } else {
      int i = (servico.id as int) - 1;
      listaServicos[i] = servico;
    }
    return Future.value(servico);
  }
}
