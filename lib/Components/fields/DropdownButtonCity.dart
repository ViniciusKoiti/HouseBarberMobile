import 'package:flutter/material.dart';

class ResponsiveDropDownButtonBarber extends StatefulWidget {
  const ResponsiveDropDownButtonBarber({Key? key}) : super(key: key);

  @override
  State<ResponsiveDropDownButtonBarber> createState() =>
      _ResponsiveDropDownButtonBarber();
}

class _ResponsiveDropDownButtonBarber
    extends State<ResponsiveDropDownButtonBarber> {
  List<String> barbers = [
    "Selecione uma barbearia",
    "barbearia 1",
    "barbearia 2"
  ];
  String barbersSelected = "Selecione uma barbearia";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        const Text("Barbearia"),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
              vertical: screenHeight * 0.01,
            ),
          ),
          value: barbersSelected,
          isExpanded: true,
          style: TextStyle(
            fontSize: screenWidth * 0.02,
          ),
          items: barbers.map((barber) {
            return DropdownMenuItem(
              value: barber,
              child: Text(barber),
            );
          }).toList(),
          onChanged: (String? barber) {
            setState(() {
              barbersSelected = barber!;
              print(barber);
            });
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
