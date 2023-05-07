import 'package:flutter/material.dart';

class CommentField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        
        Text("Sobre mim"),
        SizedBox(height:10),
        TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          
        )
      ],
    );
  }


}