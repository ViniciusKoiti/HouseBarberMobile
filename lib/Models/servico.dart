import 'dart:ffi';

class Servico {
  final String nome;
  final String descricao;
  final Double preco;

  const Servico(
      {required this.nome, required this.descricao, required this.preco});
}
