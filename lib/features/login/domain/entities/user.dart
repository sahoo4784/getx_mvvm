import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email, password;

  const User({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}
