abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginInProgressState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String email;
  final String password;

  LoginSuccessState({required this.email, required this.password});
}

class LoginErrorState extends LoginState {
  final String? emailErrorText;
  final String? passwordErrorText;

  LoginErrorState({this.emailErrorText, this.passwordErrorText});
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
