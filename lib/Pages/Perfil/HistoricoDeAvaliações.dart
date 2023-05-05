import 'package:flutter/material.dart';
import 'package:housebarber/Components/Container.dart';
import 'package:housebarber/Components/barberReviewsPage.dart';
import 'package:housebarber/Components/customAppBar.dart';

class HistoricoBarbeiros extends StatelessWidget {
  final List<int> ratings = [4, 5, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BarberReviewsPage(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
