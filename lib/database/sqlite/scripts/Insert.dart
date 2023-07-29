List<String> servicoInserts = [
  "INSERT INTO servico(id, nome, descricao, preco, cliente_id) VALUES(1, 'Corte de Cabelo', 'Corte de cabelo estilo moderno', 30.0, 1);",
  "INSERT INTO servico(id, nome, descricao, preco, cliente_id) VALUES(2, 'Barba', 'Aparar e modelar a barba', 20.0, 1);",
  "INSERT INTO servico(id, nome, descricao, preco, cliente_id) VALUES(3, 'Coloração', 'Coloração de cabelo', 50.0, 1);"
];

List<String> clienteInserts = [
  "INSERT INTO cliente(id, name, telefone, imgUrl, cpfCpnj, cep) VALUES(1, 'João', '123456789', 'https://example.com/image1.png', '12345678901', '12345000');"
];

List<String> produtoInserts = [
  "INSERT INTO produto (descricao, marca, preco, quantidade, nome) VALUES ('Descrição do Produto 1', 'Marca do Produto 1', 10.99, 50, 'Produto 1');",
  "INSERT INTO produto (descricao, marca, preco, quantidade, nome) VALUES ('Descrição do Produto 2', 'Marca do Produto 2', 19.99, 30, 'Produto 2');",
  "INSERT INTO produto (descricao, marca, preco, quantidade, nome) VALUES ('Descrição do Produto 3', 'Marca do Produto 3', 5.99, 20, 'Produto 3');"
];
