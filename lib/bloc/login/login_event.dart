abstract class LoginEvent {}

class LoginSubmitEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitEvent({required this.email, required this.password});
}

class LoginChangeEmailEvent extends LoginEvent {
  final String email;

  LoginChangeEmailEvent({required this.email});
}

class LoginChangePasswordEvent extends LoginEvent {
  final String password;

  LoginChangePasswordEvent({required this.password});
}
