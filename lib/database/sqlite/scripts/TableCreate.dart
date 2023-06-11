enum TableCreate { cliente, servico, cliente_servico }

final Map<TableCreate, String> tableSqlMap = {
  TableCreate.cliente: """
      CREATE TABLE cliente(id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(100),
      telefone VARCHAR(100),
      imgUrl VARCHAR(100),
      cpfCpnj VARCHAR(100),
      cep VARCHAR(100)",
      """,
  TableCreate.servico: """
    CREATE TABLE servico (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    descricao TEXT,
    preco REAL
  );  
  """,
  TableCreate.cliente_servico: """
    CREATE TABLE cliente_servico (
    cliente_id INTEGER,
    servico_id INTEGER,
    PRIMARY KEY(cliente_id, servico_id),
    FOREIGN KEY(cliente_id) REFERENCES cliente(id),
    FOREIGN KEY(servico_id) REFERENCES servico(id)
  );
  """
};

extension TableSqlMapper on TableCreate {
  static final table = {
    TableCreate.cliente:
        "CREATE TABLE cliente(id INTEGER PRIMARY KEY AUTOINCREMENT,name VARCHAR(100),telefone VARCHAR(100),imgUrl VARCHAR(100),cpfCpnj VARCHAR(100),cep VARCHAR(100)",
  };
}
