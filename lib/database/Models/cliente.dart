import 'package:housebarber/database/Models/avaliacao.dart';
import 'package:housebarber/database/Models/servico.dart';

class Cliente {
  final dynamic id;
  final String nome;
  final String telefone;
  final String imgUrl;
  final String cpfCpnj;
  final String cep;
  List<Servico> servicos = [];
  List<Avaliacao> avaliacoes = [];

  Cliente(
      {required this.cpfCpnj,
      required this.cep,
      required this.id,
      required this.nome,
      required this.telefone,
      required this.imgUrl,
      required this.servicos,
      required this.avaliacoes});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cliente && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
