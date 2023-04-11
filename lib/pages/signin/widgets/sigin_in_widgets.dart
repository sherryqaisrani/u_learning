import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';

AppBar buildInAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(
        1.0,
      ),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    centerTitle: true,
    title: Text(
      'Log In',
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildThirdPartyLoginWidget() {
  return Container(
      margin: EdgeInsets.only(
        top: 40.h,
        bottom: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcon(
            imagePath: "assets/icons/google.png",
          ),
          _reusableIcon(
            imagePath: "assets/icons/apple.png",
          ),
          _reusableIcon(
            imagePath: "assets/icons/facebook.png",
          ),
        ],
      ));
}

Widget _reusableIcon({required String imagePath}) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.h,
      width: 40.w,
      child: Image.asset(
        imagePath,
      ),
    ),
  );
}

Widget reusableText({required String text}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(
          0.5,
        ),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget reusableTextFormField(
    String hintText, String textType, String iconName) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(
      bottom: 20.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        15.r,
      ),
      border: Border.all(
        color: Colors.black,
        width: 1,
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          margin: EdgeInsets.only(
            left: 17.w,
          ),
          child: Image.asset(
            "assets/icons/$iconName.png",
          ),
        ),
        SizedBox(
          height: 50.h,
          width: 270.w,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            obscureText: textType == "password" ? true : false,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
            decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(
                  0.5,
                ))),
          ),
        )
      ],
    ),
  );
}

Widget forgetTextColor() {
  return Container(
    margin: EdgeInsets.only(
      left: 25.w,
    ),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forget Password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
          ),
        )),
  );
}

Widget resuableLoginRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: buttonType == "login" ? 30.h : 20.h,
      ),
      decoration: BoxDecoration(
          color: buttonType == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(
            15.r,
          ),
          border: Border.all(
            color: buttonType == "login"
                ? Colors.transparent
                : AppColors.primaryText,
          )),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 14.sp,
            color: buttonType == "login"
                ? AppColors.primaryBackground
                : AppColors.primaryText,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}
