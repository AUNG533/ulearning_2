import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_2/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_2/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProvider {
  static get allBlocProvider => [
    BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
    BlocProvider(lazy: false, create: (context) => SignInBloc()),
  ];
}