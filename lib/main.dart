import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_2/pages/sign_in/sign_in.dart';
import 'package:ulearning_2/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_2/pages/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // lazy: false,
          create: (context) => WelcomeBloc(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
            )
          ),
          home: const Welcome(),
          routes: {
            "signIn": (context) => const SignIn(),
          },
        ),
      ),
    );
  }
}
