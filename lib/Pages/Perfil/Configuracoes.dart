import 'package:flutter/material.dart';
import 'package:housebarber/Components/bottomNavBar.dart';
import 'package:housebarber/Components/configs.dart';

class Configuracoes extends StatelessWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              Configs(),
              // Adicione outros componentes ou widgets aqui
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
