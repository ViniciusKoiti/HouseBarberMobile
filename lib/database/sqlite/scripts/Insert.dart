List<String> servicoInserts = [
  "INSERT INTO servico(id, nome, descricao, preco, cliente_id) VALUES(1, 'Corte de Cabelo', 'Corte de cabelo estilo moderno', 30.0, 1);",
  "INSERT INTO servico(id, nome, descricao, preco, cliente_id) VALUES(2, 'Barba', 'Aparar e modelar a barba', 20.0, 1);",
  "INSERT INTO servico(id, nome, descricao, preco, cliente_id) VALUES(3, 'Coloração', 'Coloração de cabelo', 50.0, 1);"
];

List<String> clienteInserts = [
  "INSERT INTO cliente(id, name, telefone, imgUrl, cpfCpnj, cep) VALUES(1, 'João', '123456789', 'https://example.com/image1.png', '12345678901', '12345000');"
];
