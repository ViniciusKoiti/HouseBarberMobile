class Servico {
  final dynamic id;
  final String nome;
  final String descricao;
  final int cliente_id;
  final double preco;

  const Servico({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.cliente_id,
  });
}
