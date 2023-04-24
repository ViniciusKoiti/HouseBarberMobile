import 'package:flutter/material.dart';

class ContainerCentral extends StatelessWidget {
  final List<Widget> widgets;

  const ContainerCentral({super.key, required this.widgets});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 17, 17, 18),
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 100),
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                child: Center(
              child: Column(
                children: widgets,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
