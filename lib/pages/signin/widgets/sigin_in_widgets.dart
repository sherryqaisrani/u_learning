import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildInAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(
        1.0,
      ),
      child: Container(
        color: Colors.grey.withOpacity(
          0.5.h,
        ),
        height: 1.0,
      ),
    ),
    centerTitle: true,
    title: Text(
      'Log In',
      style: TextStyle(
        color: Colors.black,
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

Widget reusableTextFormField(String text, String textType) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.redAccent,
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
            "assets/icons/user.png",
          ),
        ),
        SizedBox(
          height: 50.h,
          width: 270.w,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: "Enter your email address",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
