import 'package:flutter/material.dart';

class ServicosRealizadosPage extends StatelessWidget {
  const ServicosRealizadosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços Realizados'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text('Serviço ${index + 1}'),
              subtitle: const Text(
                  'Barbeiro: João Silva\nData: 01/05/2022\nPreço: R\$ 50,00'),
            ),
          );
        },
      ),
    );
  }
}
