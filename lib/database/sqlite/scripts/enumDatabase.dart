
enum TableCreate{
  cliente,
}

final insercoes = [
  "INSERT INTO cliente(id, name, telefone, imgUrl, cpfCpnj, cep) VALUES ('ViniciuK','44997479875','urlimage','9878584','9875563')"
];

final Map<TableCreate, String> tableSqlMap = {
  TableCreate.cliente:
      "CREATE TABLE cliente(id INTEGER PRIMARY KEY AUTOINCREMENT,name VARCHAR(100),telefone VARCHAR(100),imgUrl VARCHAR(100),cpfCpnj VARCHAR(100),cep VARCHAR(100)",
};

extension TableSqlMapper on TableCreate {
  static final table = {
    TableCreate.cliente:"CREATE TABLE cliente(id INTEGER PRIMARY KEY AUTOINCREMENT,name VARCHAR(100),telefone VARCHAR(100),imgUrl VARCHAR(100),cpfCpnj VARCHAR(100),cep VARCHAR(100)",
  };
}

