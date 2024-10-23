
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/imagePicker/presentation/image_picker_bloc/image_picker_bloc.dart';
import 'features/increament_counter/presentation/counter_bloc/counter_bloc.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/switch_n_slider/presentation/switch/switch_bloc.dart';
import 'routing/route_config.dart';
import 'utils/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerUtils(),context),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routeInformationParser: AppRoutes().router.routeInformationParser,
        routerDelegate: AppRoutes().router.routerDelegate,
        routeInformationProvider: AppRoutes().router.routeInformationProvider,
      ),
    );
  }
}
