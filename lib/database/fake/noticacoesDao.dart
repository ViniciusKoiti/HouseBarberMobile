import 'dart:async';

import 'package:housebarber/database/genericDao.dart';

import '../Models/notificao.dart';

class NotificacoesDao extends GenericDao<Notificacao> {
  var notificacoes = [
    const Notificacao(
      id: "1",
      nome: "Notificação 1",
      descricao: "Descrição da notificação 1",
      tipos: TiposNotificacao.agenda,
    ),
    const Notificacao(
      id: "2",
      nome: "Notificação 2",
      descricao: "Descrição da notificação 2",
      tipos: TiposNotificacao.mensagem,
    ),
    const Notificacao(
      id: "3",
      nome: "Notificação 3",
      descricao: "Descrição da notificação 3",
      tipos: TiposNotificacao.atualizacao,
    ),
    const Notificacao(
      id: "4",
      nome: "Notificação 4",
      descricao: "Descrição da notificação 4",
      tipos: TiposNotificacao.cliente,
    ),
  ];

  @override
  bool excluir(dynamic id) {
    notificacoes.remove(notificacoes[id - 1]);
    return true;
  }

  @override
  Future<Notificacao> getById(dynamic id) {
    return Future.value(notificacoes[id - 1]);
  }

  @override
  Future<List<Notificacao>> listarTodos() {
    return Future.value(notificacoes);
  }

  @override
  Notificacao salvar(Notificacao notificacao) {
    if (notificacao.id == null) {
      notificacao = Notificacao(
          id: notificacoes.length,
          nome: notificacao.nome,
          descricao: notificacao.nome,
          tipos: notificacao.tipos);
      notificacoes.add(notificacao);
    } else {
      int i = (notificacao.id as int) - 1;
      notificacoes[i] = notificacao;
    }
    return notificacao;
  }
}
