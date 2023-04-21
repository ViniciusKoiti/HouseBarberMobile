import 'package:flutter/material.dart';

class DropDownButtonCity extends StatefulWidget {
  const DropDownButtonCity({super.key});

  @override
  State<DropDownButtonCity> createState() => _DropDownButtonCity();
}

class _DropDownButtonCity extends State<DropDownButtonCity> {
  // Imagino que teriamos que ter uma lista de Cidades para trazer do back para o front
  List<String> cities = ["Selecione uma cidade", "Paranavaí","São Paulo"];
  String selectedCity = "Selecione uma cidade";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        const Text("Cidade"),
        SizedBox(height: 5),
        DropdownButtonFormField(
          decoration: const InputDecoration(
    border: OutlineInputBorder(),
  ),
            value: selectedCity,
            isExpanded: true,
            style: TextStyle(),
        items: cities.map((city){
        return DropdownMenuItem(
        child: Text(city),
        value: city,
        );
  }).toList(), 
        onChanged: (city){
          setState(() {
          selectedCity = city!;
          print("$city");
          });
        }),
        SizedBox(height: 10),
      ],
    );
  }
}