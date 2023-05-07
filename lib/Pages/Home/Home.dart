import 'package:flutter/material.dart';
import 'package:housebarber/Components/logoWithCircle.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const LogoWithCircle(), // Seu widget personalizado aqui
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            // Seus campos de cadastro aqui
          ],
        ),
      ),
    );
  }
}
