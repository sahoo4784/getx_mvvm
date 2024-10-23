import 'package:bloc/bloc.dart';

import 'switch_event.dart';
import 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<SwitchOnOrOffEvent>(_handleSwitchOnOff);
    on<SliderSlideEvent>(_handleSlidingSlider);
  }

  _handleSwitchOnOff(SwitchOnOrOffEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitchOn));
  }

  _handleSlidingSlider(SliderSlideEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.sliderValue));
  }
}
