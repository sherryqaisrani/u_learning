import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/pages/signin/bloc/signin_bloc.dart';
import 'package:u_learning/pages/signin/bloc/signin_state.dart';
import 'package:u_learning/pages/signin/bloc/signing_event.dart';
import 'package:u_learning/pages/signin/widgets/sigin_in_widgets.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildInAppBar(),
        body: SingleChildScrollView(
          child: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLoginWidget(),
                Center(
                  child: reusableText(
                    text: "Or Use your email Account",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 56.h,
                  ),
                  padding: EdgeInsets.only(left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText(
                        text: "Email",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      reusableTextFormField(
                          "Enter Your Email Address", "email", "user", (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                      reusableText(
                        text: "Password",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      reusableTextFormField(
                          "Enter Your Password", "password", "user",(value) {
                            context.read<SignInBloc>().add(PasswordEvent(value));
                          }),
                    ],
                  ),
                ),
                forgetTextColor(),
                resuableLoginRegButton("Login", "login"),
                resuableLoginRegButton("Registration", "registration"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
