
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1.0,
      ),
    ),
    title: Text(
      "Log In",
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.w),
    padding: const EdgeInsets.symmetric(horizontal: 50),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        reusableIcons("google"),
        reusableIcons("apple"),
        reusableIcons("facebook"),
      ],
    ),
  );
}

Widget reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.3),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
        color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: Colors.black)

    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          width: 16.w,
          height: 16.h,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(

          width: 270.w,
          height: 50.h,
          child: TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                )
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
              ),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  )
              ),
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))
            ),
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Avenir",
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}
