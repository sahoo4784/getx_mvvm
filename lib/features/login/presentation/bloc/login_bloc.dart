import 'package:bloc/bloc.dart';

import '../../../../utils/validator.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<EmailChangeEvent>(_handleEmailChange);
    on<PasswordChangeEvent>(_handlePasswordChange);
    on<LoginRequestedEvent>(_handleLoginSubmit);
  }

  _handleEmailChange(EmailChangeEvent event, Emitter<LoginState> emit) {
    emit(InvalidEmailState(Validator.validateEmail(event.email)));
  }

  _handlePasswordChange(PasswordChangeEvent event, Emitter<LoginState> emit) {
    emit(InvalidPasswordState(Validator.validatePassword(event.password)));
  }

  _handleLoginSubmit(LoginRequestedEvent event, Emitter<LoginState> emit) {
    emit(LoginLoadingState());
  }
}
