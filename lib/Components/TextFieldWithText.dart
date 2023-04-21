import 'package:flutter/material.dart';

class TextFieldWithText extends StatelessWidget{
  const TextFieldWithText({required this.title});
  
  final String title;
  

  @override
  Widget build(BuildContext context) {
    return 

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        title,textAlign: TextAlign.left,),
      const SizedBox(height: 10),
      TextField(
        textAlign: TextAlign.left,
        decoration: 
        InputDecoration(
          labelText: title,
        border:OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        
        ),

        
      ),
      const SizedBox(height: 20)
    ],
    
    );
    
  }

}