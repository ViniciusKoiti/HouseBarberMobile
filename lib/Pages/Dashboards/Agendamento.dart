import 'package:flutter/material.dart';
import 'package:housebarber/Components/appBar/bottomNavBar.dart';
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
        dataSource: _getCalendarDataSource(),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
  
}
class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}
DataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(days: 1)),
    isAllDay: true,
    subject: 'Meeting',
    color: Colors.blue,
    location: "viniusdagasd",
    startTimeZone: '',
    endTimeZone: '',
  ));

  return DataSource(appointments);
}
