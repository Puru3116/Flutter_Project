import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSubmitted>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate API
      emit(AuthSuccess());
    });
  }
}
