import 'package:housebarber/Models/avaliacao.dart';

class Cliente {
  final String nome;
  final String telefone;
  final List<Avaliacao> avaliacoes;

  const Cliente(
      {required this.nome, required this.telefone, required this.avaliacoes});
}
