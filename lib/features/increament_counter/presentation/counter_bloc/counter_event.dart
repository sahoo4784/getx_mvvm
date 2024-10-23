import 'package:equatable/equatable.dart';

class CounterEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class IncreamentCounterEvent extends CounterEvent {}

class DecreamentCounterEvent extends CounterEvent {}
