

import 'package:flutter/material.dart';

class ContainerCentral extends StatelessWidget{
  final List<Widget> widgets;

  const ContainerCentral({super.key, required this.widgets});
  @override
  Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(title:const Text("Login")),
      body:Padding(padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(child: 
            Center(
              child: Column(
                children: [
                  widgets,
                ],
              ),
            )
          )
        ],
      ),))
  }
}
