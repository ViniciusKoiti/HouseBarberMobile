import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:housebarber/Components/ButtonConfirm.dart';
import 'package:housebarber/Components/Container.dart';
import 'package:housebarber/Components/InlineFields.dart';
import 'package:housebarber/Components/TextFieldWithText.dart';
import 'package:housebarber/Components/customAppBar.dart';

class ListaBarbeiro extends StatelessWidget {
  const ListaBarbeiro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(), bottomNavigationBar: BottomNavBar());
  }
}
