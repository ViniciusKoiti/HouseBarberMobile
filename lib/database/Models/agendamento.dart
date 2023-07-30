import 'dart:ui';

class Agendamento {
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

  Agendamento(
      this.eventName, this.from, this.to, this.background, this.isAllDay);
}
