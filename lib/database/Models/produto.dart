class Produto {
  final dynamic id;
  final String nome;
  final String descricao;
  final String marca;
  final double quantidade;
  final double preco;
  final dynamic servico_id;

  const Produto(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.servico_id,
      required this.quantidade,
      required this.preco,
      required this.marca});
}
