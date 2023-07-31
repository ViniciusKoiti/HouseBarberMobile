enum TableCreate {
  cliente,
  servico,
  agendamento,
  produto,
  endereco,
  produto_servico
}

final Map<TableCreate, String> tableSqlMap = {
  TableCreate.cliente:
      """
      CREATE TABLE cliente(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100),
        telefone VARCHAR(100),
        imgUrl VARCHAR(100),
        cpfCpnj VARCHAR(100),
        cep VARCHAR(100)
      );
  """,
  TableCreate.servico:
      """
    CREATE TABLE servico(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(100),
      descricao TEXT,
      preco REAL,
      cliente_id INTEGER,
      produto_id INTEGER,
      FOREIGN KEY(produto_id) REFERENCES produto(id),
      FOREIGN KEY(cliente_id) REFERENCES cliente(id)
    );
  """,
  TableCreate.agendamento:
      """
    CREATE TABLE agendamento(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    eventName TEXT,
    fromMillis INTEGER,
    toMillis INTEGER,
    backgroundColor INTEGER,
    isAllDay INTEGER,
    servico_id INTEGER,
    cliente_id INTEGER,
    FOREIGN KEY(cliente_id) REFERENCES cliente(id),
    FOREIGN KEY(servico_id) REFERENCES servico(id)
  );
  '''
""",
  TableCreate.produto:
      """
 CREATE TABLE produto (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  descricao TEXT,
  marca TEXT,
  preco REAL,
  quantidade REAL,
  nome TEXT
);
""",
  TableCreate.endereco:
      """
  CREATE TABLE endereco(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      bairro VARCHAR(100),
      rua VARCHAR(100),
      logradouro VARCHAR(100),
      cliente_id INTEGER,
      FOREIGN KEY(cliente_id) REFERENCES cliente(id)
    );
""",
  TableCreate.produto_servico:
      """CREATE TABLE produto_servico(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      produto_id INTEGER,
      servico_id INTEGER,
      FOREIGN KEY(produto_id) REFERENCES produto(id),
      FOREIGN KEY(servico_id) REFERENCES servico(id)
    );
  """
};
