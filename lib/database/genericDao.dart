abstract class GenericDao<T>{
  T salvar(T objeto);
  Future<List<T>> listarTodos();
  Future<T> getById(int id);
  bool excluir(int id);
}

