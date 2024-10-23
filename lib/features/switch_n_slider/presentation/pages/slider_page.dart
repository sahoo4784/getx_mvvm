
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/custom_widgets.dart';
import '../../../../utils/text_styles.dart';
import '../switch/switch_bloc.dart';
import '../switch/switch_event.dart';
import '../switch/switch_state.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomWidgets.text(
                    title: Labels.notifications,
                    textStyle: LabelStyles.regularRedTextStyle(
                        fontWeight: FontWeight.w600)),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitchOn != current.isSwitchOn,
                  builder: (context, state) {
                    print('switch loaded');
                    return CupertinoSwitch(
                        value: state.isSwitchOn,
                        onChanged: (bool value) {
                          context.read<SwitchBloc>().add(SwitchOnOrOffEvent());
                        });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (p,c)=>p.slider != c.slider,
              builder: (context, state) {
                print('Slider');
                return Container(
                  height: 200,
                  color: Colors.black.withOpacity(state.slider),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Slider(
                    value: state.slider,
                    onChanged: (slidedValue) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderSlideEvent(sliderValue: slidedValue));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
