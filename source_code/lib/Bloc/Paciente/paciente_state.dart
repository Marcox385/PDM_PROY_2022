part of 'paciente_bloc.dart';

abstract class PacienteState extends Equatable {
  const PacienteState();

  @override
  List<Object> get props => [];
}

class PacienteStateInitial extends PacienteState {}
class PacienteStateQR extends PacienteState {}
class PacienteStateHistory extends PacienteState {}
class PacienteStateCalendar extends PacienteState {}
class PacienteStateProfile extends PacienteState {}
class PacienteStatePromos extends PacienteState {}
