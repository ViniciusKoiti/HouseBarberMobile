import 'package:flutter/material.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  late List<String> horarios;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    // Definindo a lista de horários disponíveis para o barbeiro
    horarios =
        List.generate(10, (index) => "${index + 8}:00 - ${index + 9}:00");
    selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: horarios.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Salvando o índice do horário selecionado
            setState(() {
              selectedIndex = index;
            });
            // Exibindo um popup com as informações do horário selecionado
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Horário selecionado'),
                  content: Text(horarios[selectedIndex]),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Fechar'),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: selectedIndex == index ? Colors.blue : Colors.grey[200],
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Center(
              child: Text(
                horarios[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
