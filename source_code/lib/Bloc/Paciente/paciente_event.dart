part of 'paciente_bloc.dart';

abstract class PacienteEvent extends Equatable {
  const PacienteEvent();

  @override
  List<Object> get props => [];
}

abstract class PacienteEventCheckQR extends PacienteEvent {}
abstract class PacienteEventCheckHistory extends PacienteEvent {}
abstract class PacienteEventCheckCalendar extends PacienteEvent {}
abstract class PacienteEventCheckProfile extends PacienteEvent {}
abstract class PacienteEventCheckPromos extends PacienteEvent {}