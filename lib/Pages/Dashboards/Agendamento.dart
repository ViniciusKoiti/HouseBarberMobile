import 'package:flutter/material.dart';
import 'package:housebarber/Components/bottomNavBar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Agendamento extends StatefulWidget {
  const Agendamento({Key? key}) : super(key: key);

  @override
  _AgendamentoState createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.week,
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
