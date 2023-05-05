import 'package:flutter/material.dart';

class BarberProfile extends StatefulWidget {
  final String name;
  late final String description;
  final List<String> specialties;

  BarberProfile({
    required this.name,
    required this.description,
    required this.specialties,
  });

  @override
  _BarberProfileState createState() => _BarberProfileState();
}

class _BarberProfileState extends State<BarberProfile> {
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person_2_outlined,
                  size: 50,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Especialidades:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Wrap(
              spacing: 8,
              children: widget.specialties
                  .map((specialty) => Chip(
                        label: Text(specialty),
                      ))
                  .toList(),
            ),
            SizedBox(height: 10),
            Text(
              'Descrição:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Digite aqui...',
              ),
              onChanged: (value) {
                setState(() {
                  widget.description = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
