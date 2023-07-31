import 'dart:ui';

class Agendamento {
  dynamic id;
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  dynamic servico_id;
  dynamic cliente_id;

  Agendamento(this.id, this.eventName, this.from, this.to, this.background,
      this.isAllDay, this.servico_id, this.cliente_id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Agendamento &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
