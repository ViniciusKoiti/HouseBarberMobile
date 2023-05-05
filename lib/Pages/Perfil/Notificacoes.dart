import 'package:flutter/material.dart';

class Notificacoes extends StatelessWidget {
  const Notificacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Notificações',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildNotification(
                      title: 'Novo agendamento',
                      message:
                          'Você tem um novo agendamento para amanhã às 10h.',
                    ),
                    _buildNotification(
                      title: 'Avaliação',
                      message: 'Um cliente avaliou seu serviço com 5 estrelas.',
                    ),
                    _buildNotification(
                      title: 'Atualização',
                      message:
                          'Há uma nova versão do aplicativo disponível para download.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotification({required String title, required String message}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(message),
    );
  }
}
