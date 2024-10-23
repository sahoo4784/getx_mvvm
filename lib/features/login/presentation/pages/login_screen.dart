
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/custom_widgets.dart';
import '../../../../utils/dimensions.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Dimensions.screenHeight(context),
        width: Dimensions.screenWidth(context),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            print(state);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomWidgets.appTextField(
                        controller: emailController,
                        hintText: 'Email',
                        onChanged: (String value) {
                          if (kDebugMode) {
                            print(value);
                          }
                          context
                              .read<LoginBloc>()
                              .add(EmailChangeEvent(value));
                        },
                        enabled: true,
                        errorMessage: state is InvalidEmailState
                            ? state.errorMessage
                            : null,
                        focusNode: emailFocusNode),
                    CustomWidgets.verticalSpacing(height: 20),
                    CustomWidgets.appTextField(
                        hintText: 'Password',
                        controller: passwordController,
                        onChanged: (String value) => context
                            .read<LoginBloc>()
                            .add(PasswordChangeEvent(value)),
                        enabled: true,
                        errorMessage: state is InvalidPasswordState
                            ? state.erorMessage
                            : null,
                        focusNode: passwordFocusNode),
                    CustomWidgets.verticalSpacing(height: 20),
                    CustomWidgets.appButton(
                        onPressed: () {
                          if (state is !InvalidEmailState && state is  !InvalidPasswordState ) {
                            context.read<LoginBloc>().add(LoginRequestedEvent(
                                email: emailController.text,
                                password: passwordController.text));
                          }
                        },
                        buttonLabel: 'Login',
                        color: state is !InvalidEmailState && state is  !InvalidPasswordState
                            ? Colors.green
                            : Colors.green.withOpacity(0.3))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
