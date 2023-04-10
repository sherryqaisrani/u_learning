import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/main.dart';
import 'package:u_learning/pages/welcome/blocs/welcome_bloc.dart';
import 'package:u_learning/pages/welcome/blocs/welcome_events.dart';
import 'package:u_learning/pages/welcome/blocs/welcome_states.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(
                top: 50.h,
              ),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: controller,
                    onPageChanged: (value) {
                      print("The Index Value is $value");
                      state.page = value;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        index: 1,
                        context: context,
                        buttonName: "Next",
                        title: "First See Learning",
                        subTitle:
                            "Forget about a for of paper all knowledge in one learning",
                        imagePath: "assets/images/reading.png",
                      ),
                      _page(
                        index: 2,
                        context: context,
                        buttonName: "Next",
                        title: "Second See Learning",
                        subTitle:
                            "Forget about a for of paper all knowledge in one learning",
                        imagePath: "assets/images/boy.png",
                      ),
                      _page(
                        index: 3,
                        context: context,
                        buttonName: "Get Started",
                        title: "Third See Learning",
                        subTitle:
                            "Forget about a for of paper all knowledge in one learning",
                        imagePath: "assets/images/man.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 50.h,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: state.page.toDouble(),
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(
                          8.0,
                        ),
                        activeSize: const Size(16.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page({
    required int index,
    required BuildContext context,
    required String buttonName,
    required String title,
    required String subTitle,
    required String imagePath,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 345.h,
          width: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 10,
            right: 30,
            left: 30,
          ),
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.black.withOpacity(
                0.5,
              ),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              controller.animateToPage(index,
                  duration: Duration(seconds: 500), curve: Curves.easeIn);
            } else {
             Navigator.pushNamedAndRemoveUntil(context, "/signingPageRoute",(route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  15.w,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(
                    0.1,
                  ),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
