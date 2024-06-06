import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                    child:
                    reusableText("Enter your details below and free sing up")),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("User name"),
                      buildTextField(
                        "Enter your user name",
                        "email",
                        "user",
                            (value) {

                        },
                      ),
                      reusableText("Email"),
                      buildTextField(
                        "Enter your email address",
                        "email",
                        "user",
                            (value) {

                        },
                      ),
                      reusableText("Password"),
                      buildTextField(
                        "Re-enter password",
                        "password",
                        "lock",
                            (value) {

                        },
                      ),
                      reusableText("Password"),
                      buildTextField(
                        "Re-enter your password to confirm",
                        "password",
                        "lock",
                            (value) {

                        },
                      ),
                    ],
                  ),
                ),
            Container(
                margin: EdgeInsets.only(left: 25.w),
                child: reusableText("By creating account you have to agree with our them & condication")),
                buildLoginAndRegisterButton("Sign Up", "login", () {
                  Navigator.of(context).pushNamed("register");
                }),
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
