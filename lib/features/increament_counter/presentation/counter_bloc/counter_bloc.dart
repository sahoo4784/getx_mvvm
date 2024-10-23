import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncreamentCounterEvent>(_onIncreament);
    on<DecreamentCounterEvent>(_onDecreament);
  }

  void _onIncreament(IncreamentCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _onDecreament(DecreamentCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: state.counter > 0 ? state.counter - 1 : state.counter));
  }
}
