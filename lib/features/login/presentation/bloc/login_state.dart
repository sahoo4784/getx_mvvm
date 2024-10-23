import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class ReadyToLoginState extends LoginState {
  final String? email;
  final String? password;

  const ReadyToLoginState({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginFailedState extends LoginState {
  final String error;

  const LoginFailedState(this.error);

  @override
  List<Object> get props => [error];
}

class InvalidEmailState extends LoginState {
  final String errorMessage;

  const InvalidEmailState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ValidEmailState extends LoginState {
  const ValidEmailState();

  @override
  List<Object> get props => [];
}

class ValidPasswordState extends LoginState {
  const ValidPasswordState();

  @override
  List<Object> get props => [];
}

class InvalidPasswordState extends LoginState {
  final String erorMessage;

  const InvalidPasswordState(this.erorMessage);

  @override
  List<Object> get props => [erorMessage];
}
