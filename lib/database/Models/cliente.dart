import 'package:housebarber/database/Models/avaliacao.dart';

class Cliente {
  final dynamic id;
  final String nome;
  final String telefone;
  final String imgUrl;
  List<Avaliacao> avaliacoes = [];

  Cliente(
      {required this.id,required this.nome, required this.telefone,
      required this.imgUrl, required this.avaliacoes});
}
