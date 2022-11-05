import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';

part 'paciente_event.dart';
part 'paciente_state.dart';

class PacienteBloc extends Bloc<PacienteEvent, PacienteState> {
  PacienteBloc() : super(PacienteStateInitial()) {
    on<PacienteEventCheckQR>(_showQR);
    on<PacienteEventCheckHistory>(_showHistory);
    on<PacienteEventCheckCalendar>(_showCalendar);
    on<PacienteEventCheckProfile>(_showProfile);
    on<PacienteEventCheckPromos>(_showPromos);
  }

  Future<void> _showQR(PacienteEventCheckQR event, emit) async {
    // Query firestore for User id and turn it to qr with qr_flutter
    emit(PacienteStateQR());
  }

  Future<void> _showHistory(PacienteEventCheckHistory event, emit) async {
    // Query firestore for history
    emit(PacienteStateHistory());
  }

  Future<void> _showCalendar(PacienteEventCheckCalendar event, emit) async {
    // Query firestore for calendar
    emit(PacienteStateCalendar());
  }

  Future<void> _showProfile(PacienteEventCheckProfile event, emit) async {
    // Query firestore for profile info
    emit(PacienteStateProfile());
  }

  Future<void> _showPromos(PacienteEventCheckPromos event, emit) async {
    // Query firestore for promos
    emit(PacienteStatePromos());
  }
}
