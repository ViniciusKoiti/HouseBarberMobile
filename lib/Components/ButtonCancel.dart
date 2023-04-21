import 'package:flutter/material.dart';

class ButtonCancel extends StatelessWidget{
 

  @override
  Widget build(BuildContext context) {
    
    return TextButton(onPressed: onPressed,
    style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.grey)),
    child: Text("Cancelar")
    );
  }


  void onPressed() {
  }
}