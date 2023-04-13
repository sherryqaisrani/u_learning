import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/signin/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({required this.context});

  handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          // We Have to do sometimg
        }
        if (password.isEmpty) {
          // We have to do someting
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if(credential.user == null){

          }
          if(!credential.user!.emailVerified){
            // We have to send verification code
          }

          var user = credential.user;
          if(user!=null)
          {
            //We got verified user from firebase
          }
          else {
            // We have error user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
