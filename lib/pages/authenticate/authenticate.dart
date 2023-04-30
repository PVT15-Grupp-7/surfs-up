import 'package:flutter/material.dart';
import 'package:surfs_up/pages/authenticate/sign_up_page.dart';
import 'package:surfs_up/pages/authenticate/sign_in_page.dart';

/// This class is the wrapper for the authentication (sign in and sign up) pages.
/// Whenever the user switches between sign in and sign up, the state is updated
/// through the toggleView method.
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInPage(toggleView: toggleView);
    } else {
      return SignUpPage(toggleView: toggleView);
    }
  }

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }
}
