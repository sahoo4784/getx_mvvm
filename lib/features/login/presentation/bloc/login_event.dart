import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChangeEvent extends LoginEvent {
  final String email;

  const EmailChangeEvent(this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class PasswordChangeEvent extends LoginEvent {
  final String password;

  const PasswordChangeEvent(this.password);

  @override
  List<Object> get props => [password];
}

class LoginRequestedEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginRequestedEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
