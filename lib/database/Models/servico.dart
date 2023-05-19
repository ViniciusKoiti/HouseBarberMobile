import 'dart:ffi';

class Servico {
  final dynamic id;
  final String nome;
  final String descricao;
  final double preco;

  const Servico( 
      {required this.id,
      required this.nome, required this.descricao, required this.preco});
}
