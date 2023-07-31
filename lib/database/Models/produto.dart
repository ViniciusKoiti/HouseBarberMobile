class Produto {
  final dynamic id;
  final String nome;
  final String descricao;
  final String marca;
  final double preco;
  final double quantidade;
  const Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.quantidade,
    required this.preco,
    required this.marca,
  });
}
