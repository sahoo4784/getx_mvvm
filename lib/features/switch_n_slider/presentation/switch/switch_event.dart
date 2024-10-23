import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnOrOffEvent extends SwitchEvent {}

class SliderSlideEvent extends SwitchEvent {
  double sliderValue;

  SliderSlideEvent({required this.sliderValue});

  @override
  List<Object> get props => [sliderValue];
}
