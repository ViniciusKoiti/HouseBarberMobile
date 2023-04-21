import 'package:flutter/material.dart';

import 'ButtonCancel.dart';
import 'ButtonConfirm.dart';

class SideBox extends StatelessWidget{
 

  @override
  Widget build(BuildContext context) {
    
    return 
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      SizedBox(height: 50,),
      ButtonCancel(),
      SizedBox(width: 20,),
      ButtonConfirm(),
    ],);
  }


  void onPressed() {
  }
}