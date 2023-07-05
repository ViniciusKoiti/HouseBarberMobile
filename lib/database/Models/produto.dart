class Produto {
  final dynamic id;
  final String nome;
  final String descricao;
  final String marca;
  final double preco;
  final double quantidade;
  final dynamic servico_id;
  const Produto(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.preco,
      required this.quantidade,
      required this.servico_id,
      required this.marca});
}
