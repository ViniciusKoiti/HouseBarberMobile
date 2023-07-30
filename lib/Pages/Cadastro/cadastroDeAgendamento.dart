// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:housebarber/database/Models/agendamento.dart';

// class NewAppointmentPage extends StatefulWidget {
//   final DateTime selectedDateTime;
//   final ValueChanged<Agendamento> onAppointmentAdded;

//   NewAppointmentPage(
//       {required this.selectedDateTime, required this.onAppointmentAdded});

//   @override
//   _NewAppointmentPageState createState() => _NewAppointmentPageState();
// }

// class _NewAppointmentPageState extends State<NewAppointmentPage> {
//   final _formKey = GlobalKey<FormState>();
//   String eventName = '';
//   DateTime from = DateTime.now();
//   DateTime to = DateTime.now().add(Duration(hours: 1));
//   Color background = Colors.blue;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New Appointment'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Event Name'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter event name';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 eventName = value!;
//               },
//             ),
//             ElevatedButton(
//               child: Text('Pick start time'),
//               onPressed: () async {
//                 final DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: from,
//                   firstDate: DateTime.now().subtract(Duration(days: 365)),
//                   lastDate: DateTime.now().add(Duration(days: 365)),
//                 );
//                 if (pickedDate != null) {
//                   final TimeOfDay? pickedTime = await showTimePicker(
//                     context: context,
//                     initialTime: TimeOfDay.fromDateTime(from),
//                   );
//                   if (pickedTime != null) {
//                     setState(() {
//                       from = DateTime(
//                         pickedDate.year,
//                         pickedDate.month,
//                         pickedDate.day,
//                         pickedTime.hour,
//                         pickedTime.minute,
//                       );
//                     });
//                   }
//                 }
//               },
//             ),
//             ElevatedButton(
//               child: Text('Pick end time'),
//               onPressed: () async {
//                 final DateTime? pickedDate = await showTimePicker(
//                   context: context,
//                   initialTime: TimeOfDay.now()
//                 );
//                 if (pickedDate != null) {
//                   final TimeOfDay? pickedTime = await showTimePicker(
//                     context: context,
//                     initialTime: TimeOfDay.fromDateTime(to),
//                   );
//                   if (pickedTime != null) {
//                     setState(() {
//                       to = DateTime(
//                         pickedDate.year,
//                         pickedDate.month,
//                         pickedDate.day,
//                         pickedTime.hour,
//                         pickedTime.minute,
//                       );
//                     });
//                   }
//                 }
//               },
//             ),
//             ElevatedButton(
//               child: Text('Pick color'),
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Pick a color'),
//                       content: SingleChildScrollView(
//                         child: BlockPicker(
//                           pickerColor: background,
//                           onColorChanged: (Color newColor) {
//                             setState(() {
//                               background = newColor;
//                             });
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   widget.onAppointmentAdded(
//                     Agendamento(
//                       eventName,
//                       from,
//                       to,
//                       background,
//                       false,
//                     ),
//                   );
//                   Navigator.pop(context);
//                 }
//               },
//               child: Text('Save Appointment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
