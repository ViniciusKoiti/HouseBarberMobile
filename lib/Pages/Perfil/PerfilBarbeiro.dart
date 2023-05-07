import 'package:flutter/material.dart';
import 'package:housebarber/Components/barberProfile.dart';

class BarberProfilePage extends StatelessWidget {
  const BarberProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil do Barbeiro'),
        ),
        body: BarberProfile(
          name: 'João Silva',
          description:
              'Olá! Eu sou o João Silva e tenho 10 anos de experiência como barbeiro. Estou sempre procurando aprender novas técnicas e tendências para oferecer o melhor serviço aos meus clientes.',
          specialties: const [
            'Barba',
            'Corte clássico',
            'Corte moderno',
            'Fade',
            'Pompadour',
          ],
        ));
  }
}
