class Produto {
  final dynamic id;
  final String nome;
  final String descricao;
  final String marca;
  final double quantidade;
  final double preco;

  const Produto(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.quantidade,
      required this.preco,
      required this.marca});
}
