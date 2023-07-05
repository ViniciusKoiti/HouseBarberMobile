abstract class GenericDao<T> {
  Future<T> salvar(T objeto);
  Future<List<T>> listarTodos();
  Future<T> getById(int id);
  Future<bool> excluir(int id);
}
