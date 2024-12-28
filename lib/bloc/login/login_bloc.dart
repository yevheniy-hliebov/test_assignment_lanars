import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_lanars/bloc/login/login_event.dart';
import 'package:test_assignment_lanars/bloc/login/login_state.dart';
import 'package:test_assignment_lanars/utils/validation/validations/email_validation.dart';
import 'package:test_assignment_lanars/utils/validation/validations/password_validation.dart';
import 'package:test_assignment_lanars/utils/validation/validator.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BuildContext context;
  LoginBloc(this.context) : super(LoginInitialState()) {
    on<LoginSubmitEvent>(_onSubmitLogin);
    on<LoginChangeEmailEvent>(_onChangeEmail);
    on<LoginChangePasswordEvent>(_onChangePassword);
  }

  void _onChangeEmail(
    LoginChangeEmailEvent event,
    Emitter<LoginState> emit,
  ) {
    if (state is LoginErrorState) {
      final stateError = state as LoginErrorState;

      emit(LoginErrorState(
        emailErrorText: null,
        passwordErrorText: stateError.passwordErrorText,
      ));
    }
  }

  void _onChangePassword(
    LoginChangePasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    if (state is LoginErrorState) {
      final stateError = state as LoginErrorState;

      emit(LoginErrorState(
        emailErrorText: stateError.emailErrorText,
        passwordErrorText: null,
      ));
    }
  }

  void _onSubmitLogin(LoginSubmitEvent event, Emitter<LoginState> emit) async {
    emit(LoginInProgressState());

    String? emailErrorText =
        Validator.applyOne(context, EmailValidation())(event.email);
    String? passwordErrorText =
        Validator.applyOne(context, PasswordValidation())(event.password);

    if (emailErrorText != null || passwordErrorText != null) {
      emit(LoginErrorState(
        emailErrorText: emailErrorText,
        passwordErrorText: passwordErrorText,
      ));
    } else {
      // TODO: Додати запит для логіну
      
      emit(LoginSuccessState(
        email: event.email,
        password: event.password,
      ));
    }
  }
}
