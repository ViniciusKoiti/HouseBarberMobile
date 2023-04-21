import 'package:flutter/material.dart';

class ButtonConfirm extends StatelessWidget{
 

  @override
  Widget build(BuildContext context) {
    
    return FilledButton(onPressed: onPressed, child: 
      Text("Salvar perfil")
    );
  }


  void onPressed() {
  }
}