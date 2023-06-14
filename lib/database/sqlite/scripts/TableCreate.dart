enum TableCreate { cliente, servico }

final Map<TableCreate, String> tableSqlMap = {
   TableCreate.cliente: """
      CREATE TABLE cliente(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100),
        telefone VARCHAR(100),
        imgUrl VARCHAR(100),
        cpfCpnj VARCHAR(100),
        cep VARCHAR(100)
      );
  """,
  TableCreate.servico: """
    CREATE TABLE servico(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(100),
      descricao TEXT,
      preco REAL,
      cliente_id INTEGER,
      FOREIGN KEY(cliente_id) REFERENCES cliente(id)
    );
  """,
};

