import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitchOn;
  final double slider;

  const SwitchState({this.isSwitchOn = false, this.slider = 0.4});

  SwitchState copyWith({bool? isSwitch, double? slider}) {
    return SwitchState(
        isSwitchOn: isSwitch ?? isSwitchOn, slider: slider ?? this.slider);
  }

  @override
  List<Object> get props => [isSwitchOn,slider];
}
