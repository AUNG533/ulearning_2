import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_2/common/values/colors.dart';
import 'package:ulearning_2/pages/application/appliccation_page.dart';
import 'package:ulearning_2/pages/bloc_provider.dart';
import 'package:ulearning_2/pages/register/register.dart';
import 'package:ulearning_2/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_2/pages/sign_in/sign_in.dart';
import 'package:ulearning_2/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_2/pages/welcome/welcome.dart';

import 'common/routes/pages.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: AppColors.primaryText),
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
          )),
          // home: const ApplicationPage(),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          initialRoute: '/',
          // routes: {
          //   "signIn": (context) => const SignIn(),
          //   "register": (context) => const Register(),
          // },
        ),
      ),
    );
  }
}
