
import 'package:flutter/material.dart';
import 'package:getx_mvvm/routing/route_constants.dart';
import 'package:go_router/go_router.dart';

import '../features/increament_counter/presentation/pages/home.dart';
import '../features/login/presentation/pages/login_screen.dart';
import 'error.dart';

class AppRoutes {
  GoRouter router = GoRouter(
      routes: [
        GoRoute(
            path: '/',
            //name: RouteName.splashScreen,
            // name: RouteName.sliderScreen,
            // name: RouteName.imagePickerScreen,
            name: RouteName.loginScreen,
            pageBuilder: (context, state) {
              // return const MaterialPage(child: SplashScreen());
              // return const MaterialPage(child: SliderPage());
              // return const MaterialPage(child: ImagePickerScreen());
              return const MaterialPage(child: LoginScreen());
            }),
        GoRoute(
            path: PathName.home,
            name: RouteName.home,
            pageBuilder: (context, state) {
              return const MaterialPage(child: MyHomePage());
            }),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPage());
      });
}
