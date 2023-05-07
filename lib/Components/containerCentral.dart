import 'package:flutter/material.dart';

class ContainerCentral extends StatelessWidget {
  final List<Widget> widgets;

  const ContainerCentral({Key? key, required this.widgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,

            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 100),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Center(
                child: Column(
                  children: widgets,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
