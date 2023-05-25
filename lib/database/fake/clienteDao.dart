import 'package:housebarber/database/Models/cliente.dart';
import 'package:housebarber/database/Models/avaliacao.dart';
import 'package:housebarber/database/genericDao.dart';

class ClienteDao extends GenericDao<Cliente> {
  List<Cliente> listaCliente = [
    Cliente(
      nome: "João",
      telefone: "(11) 99999-9999",
      avaliacoes: [
        Avaliacao(
          nota: 5,
          comentario: "Ótimo atendimento!",
          data: DateTime(2022, 1, 1),
        ),
        Avaliacao(
          nota: 4,
          comentario: "Preço um pouco alto",
          data: DateTime(2022, 2, 1),
        ),
      ],
      imgUrl: '',
      id: null,
      cep: '',
      cpfCpnj: '',
    ),
    Cliente(
      nome: "Maria",
      telefone: "(11) 88888-8888",
      avaliacoes: [
        Avaliacao(
          nota: 3,
          comentario: "Demorou um pouco",
          data: DateTime(2022, 3, 1),
        ),
        Avaliacao(
          nota: 5,
          comentario: "Excelente profissional",
          data: DateTime(2022, 4, 1),
        ),
      ],
      id: 1,
      imgUrl: '',
      cep: '',
      cpfCpnj: '',
    ),
  ];

  @override
  bool excluir(dynamic id) {
    listaCliente.remove(listaCliente[id - 1]);
    return true;
  }

  @override
  Future<Cliente> getById(dynamic id) {
    Cliente cliente = listaCliente[id - 1];
    return Future.value(cliente);
  }

  @override
  Future<List<Cliente>> listarTodos() {
    return Future.value(listaCliente);
  }

  @override
  Cliente salvar(Cliente cliente) {
    if (cliente.id == null) {
      cliente = Cliente(
          avaliacoes: [],
          id: null,
          imgUrl: '',
          nome: '',
          telefone: '',
          cep: '',
          cpfCpnj: '');
      listaCliente.add(cliente);
    } else {
      int i = (cliente.id as int) - 1;
      listaCliente[i] = cliente;
    }
    return cliente;
  }
}
