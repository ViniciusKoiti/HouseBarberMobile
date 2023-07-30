import 'package:flutter/material.dart';
import 'package:housebarber/Components/appBar/bottomNavBar.dart';
import 'package:housebarber/database/Models/agendamento.dart';
import 'package:housebarber/database/Models/cliente.dart';
import 'package:housebarber/database/Models/servico.dart';
import 'package:housebarber/database/sqlite/dao/clienteDaoSQLLite.dart';
import 'package:housebarber/database/sqlite/dao/servicoDaoSQLite.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AgendamentoScreen extends StatefulWidget {
  const AgendamentoScreen({Key? key}) : super(key: key);

  @override
  _AgendamentoScreenState createState() => _AgendamentoScreenState();
}

class _AgendamentoScreenState extends State<AgendamentoScreen> {
  final CalendarController _controller = CalendarController();
  List<Agendamento> meetings = <Agendamento>[];
  ClienteDaoSQLite clienteDaoSQLite = ClienteDaoSQLite();
  ServicoDaoSQLite servicoDaoSQLite = ServicoDaoSQLite();

  Cliente? dropdownValueCliente;
  Servico? dropdownValueServico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        controller: _controller,
        view: CalendarView.week,
        dataSource: MeetingDataSource(meetings),
        onTap: calendarTapped,
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (_controller.view == CalendarView.month) return;

    final DateTime selectedDateTime = calendarTapDetails.date!;
    final Agendamento? selectedMeeting =
        calendarTapDetails.targetElement == CalendarElement.appointment
            ? calendarTapDetails.appointments!.isNotEmpty
                ? calendarTapDetails.appointments![0] as Agendamento
                : null
            : null;

    if (selectedMeeting == null) {
      _controller.displayDate = DateTime.now();
      _showAddMeetingDialog(selectedDateTime);
    } else {}
  }

  Future<void> _showAddMeetingDialog(DateTime selectedDateTime) async {
    final TextEditingController _eventController = TextEditingController();
    DateTime from = selectedDateTime;
    DateTime to = selectedDateTime.add(const Duration(hours: 1));
    List<Cliente> clientes = await clienteDaoSQLite.listarTodos();
    List<Servico> servicos = await servicoDaoSQLite.listarTodos();

    if (clientes.isNotEmpty) {
      dropdownValueCliente = dropdownValueCliente ?? clientes.first;
    }

    if (servicos.isNotEmpty) {
      dropdownValueServico = dropdownValueServico ?? servicos.first;
    }

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicione um agenda'),
          content: SingleChildScrollView(
              child: Column(
            children: [
              TextField(
                controller: _eventController,
                decoration:
                    InputDecoration(hintText: 'Digite o nome do agendamento'),
              ),
              Container(
                  width: double.infinity,
                  child: FutureBuilder<List<Servico>>(
                    future: servicoDaoSQLite.listarTodos(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Servico>> snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButton<Servico>(
                          isExpanded: true,
                          value: dropdownValueServico,
                          onChanged: (Servico? newValue) {
                            setState(() {
                              dropdownValueServico = newValue;
                            });
                          },
                          items: snapshot.data!
                              .map<DropdownMenuItem<Servico>>((Servico value) {
                            return DropdownMenuItem<Servico>(
                              value: value,
                              child: DropdownMenuItem<Servico>(
                                value: value,
                                child: Text(value.nome),
                              ),
                            );
                          }).toList(),
                        );
                      } else if (snapshot.hasError) {
                        return Text("Erro: ${snapshot.error}");
                      }
                      // Enquanto a lista de clientes não está carregada, exiba um indicador de progresso
                      return CircularProgressIndicator();
                    },
                  )),
              Container(
                  width: double.infinity,
                  child: FutureBuilder<List<Cliente>>(
                    future: clienteDaoSQLite.listarTodos(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Cliente>> snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButton<Cliente>(
                          value: dropdownValueCliente,
                          onChanged: (Cliente? newValue) {
                            setState(() {
                              dropdownValueCliente = newValue;
                            });
                          },
                          items: snapshot.data!
                              .map<DropdownMenuItem<Cliente>>((Cliente value) {
                            return DropdownMenuItem<Cliente>(
                              value: value,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(value.nome),
                                  // This is your icon.
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      } else if (snapshot.hasError) {
                        return Text("Erro: ${snapshot.error}");
                      }
                      // Enquanto a lista de clientes não está carregada, exiba um indicador de progresso
                      return CircularProgressIndicator();
                    },
                  )),
              ElevatedButton(
                child: Text('Escolha o inicio do agendamento'),
                onPressed: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(from),
                  );
                  if (pickedTime != null) {
                    from = DateTime(
                      from.year,
                      from.month,
                      from.day,
                      pickedTime.hour,
                      pickedTime.minute,
                    );
                  }
                },
              ),
              ElevatedButton(
                child: Text('Escolha o inicio do agendamento'),
                onPressed: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(to),
                  );
                  if (pickedTime != null) {
                    to = DateTime(
                      to.year,
                      to.month,
                      to.day,
                      pickedTime.hour,
                      pickedTime.minute,
                    );
                  }
                },
              ),
            ],
          )),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Salvar'),
              onPressed: () {
                if (_eventController.text.isNotEmpty) {
                  setState(() {
                    meetings.add(
                      Agendamento(
                        _eventController.text,
                        from,
                        to,
                        Color.fromARGB(255, 147, 141, 179),
                        false,
                      ),
                    );
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
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

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Agendamento> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
