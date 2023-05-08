import 'package:flutter/material.dart';
import 'package:housebarber/Components/barberReviewsPage.dart';
import 'package:housebarber/Components/appBar/bottomNavBar.dart';

class HistoricoBarbeiros extends StatelessWidget {
  HistoricoBarbeiros({super.key});
  final List<int> ratings = [4, 5, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BarberReviewsPage(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
