import 'package:flutter/material.dart';

import 'Buttons/ButtonCancel.dart';
import 'Buttons/ButtonConfirm.dart';

class SideBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
        ),
        ButtonCancel(title: "Cancele"),
        SizedBox(
          height: 20,
        ),
        ButtonConfirm(
          title: '',
          onPressed: () {},
          color: Colors.black,
        ),
      ],
    );
  }

  void onPressed() {}
}
