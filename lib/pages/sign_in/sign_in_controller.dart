import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_2/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          //
          print("email empty");
        } else {
          print("email is $emailAddress");
        }

        if (password.isEmpty) {
          //
          print("password empty");
        } else {
          print("password is $password");
        }

        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if(credential.user == null){
            //
            print("user does not exist");
          }
          if(!credential.user!.emailVerified){
            //
            print("not verified");
          }
          var  user = credential.user;
          if(user != null){
            //we got verified user from firebase
            print("user exists");
          } else {
            print("no user");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found'){
            print("No user found for that user.");
          } else if (e.code == 'wrong-password'){
            print("Wrong password provided for that user.");
          }
        }
      }
    } catch (e) {}
  }
}
