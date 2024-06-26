import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_2/common/values/colors.dart';
import 'package:ulearning_2/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning_2/pages/home/bloc/home_page_events.dart';
import 'package:ulearning_2/pages/home/bloc/home_page_states.dart';

import '../../../common/widgets/base_text_widget.dart';

AppBar buildAppBar(String avatar) {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(avatar),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.sp),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourthElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: "Search your courses",
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                    hintStyle: TextStyle(
                        color: AppColors.primarySecondaryElementText)),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      SizedBox(width: 5.w),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

Widget slidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(),
            _slidersContainer(path: "assets/icons/image_1.png"),
            _slidersContainer(path: "assets/icons/image_2.png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThirdElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
        ),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText("Choose your course"),
            reusableText("See all",
                color: AppColors.primaryThirdElementText, fontSize: 10),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText(
              "Popular",
              textColor: AppColors.primaryThirdElementText,
              backGroundColor: Colors.white,
            ),
            _reusableMenuText(
              "Newest",
              textColor: AppColors.primaryThirdElementText,
              backGroundColor: Colors.white,
            ),
          ],
        ),
      )
    ],
  );
}



// for the menu button, reusable text
Widget _reusableMenuText(
  String menuText, {
  Color textColor = AppColors.primaryElementText,
  Color backGroundColor = AppColors.primaryElement,
}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    decoration: BoxDecoration(
      color: backGroundColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: backGroundColor),
    ),
    child: reusableText(
      menuText,
      color: textColor,
      fontSize: 11,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    width: 100,
    height: 100,
    decoration: const BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/icons/image_2.png")),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best course for IT",
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
        ),
        Text(
          "Flutter best course",
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryFourthElementText,
            fontWeight: FontWeight.normal,
            fontSize: 11.sp,
          ),
        ),
      ],
    ),
  );
}