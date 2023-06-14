import 'dart:ffi';

import 'package:housebarber/database/Models/cliente.dart';

class Servico {
  final dynamic id;
  final String nome;
  final String descricao;
  final Cliente cliente;
  final double preco;

  const Servico({
    this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.cliente,
  });
}
