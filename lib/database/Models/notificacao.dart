class Notificacao {
  final dynamic id;
  final String nome;
  final String descricao;
  final TiposNotificacao tipos;

  const Notificacao(
      {required this.id,required this.nome, required this.descricao,required this.tipos});
}

enum TiposNotificacao {
  agenda,
  mensagem, 
  atualizacao, 
  cliente,
}
