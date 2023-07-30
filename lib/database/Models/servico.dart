class Servico {
  final dynamic id;
  final String nome;
  final String descricao;
  final int cliente_id;
  final double preco;
  final int produto_id;

  const Servico({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.cliente_id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Servico && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
