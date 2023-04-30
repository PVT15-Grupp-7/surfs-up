import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:surfs_up/services/authentication_service.dart';
import 'package:surfs_up/shared/constants/colors.dart';
import 'package:surfs_up/shared/constants/text_input_decoration.dart';
import 'package:surfs_up/shared/widgets/snack_bar_widget.dart';

/// Class which displays the Sign up page, utilizing the [AuthenticationService] class.
class SignUpPage extends StatefulWidget {
  final Function toggleView;

  const SignUpPage({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthenticationService _auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/surfs_up_logo.png', scale: 1.5),
                const SizedBox(height: 10.0),
                const Text('Create account',
                    style: TextStyle(color: Colors.white, fontSize: 25.0)),
                const SizedBox(height: 20.0),
                _emailTextFormField(),
                const SizedBox(height: 30.0),
                _passwordTextFormField(),
                const SizedBox(height: 20.0),
                _signUpButton(),
                const Text('or', style: TextStyle(color: Colors.white)),
                _googleSignUpButton(),
                const SizedBox(height: 50.0),
                const Text('Already have an account?',
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10.0),
                _signInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Text form field for the email which changes state and updates the email variable.
  TextFormField _emailTextFormField() {
    return TextFormField(
      decoration: textInputDecoration.copyWith(hintText: 'Email'),
      style: const TextStyle(color: Colors.white),
      validator: (val) => val!.isEmpty ? 'Enter an email' : null,
      onChanged: (val) {
        setState(() => email = val);
      },
    );
  }

  /// Text form field for the password which changes state and updates the password variable.
  TextFormField _passwordTextFormField() {
    return TextFormField(
      decoration: textInputDecoration.copyWith(hintText: 'Password'),
      style: const TextStyle(color: Colors.white),
      validator: (val) => val!.length < 6
          ? 'Enter a password at least six characters long'
          : null,
      obscureText: true,
      onChanged: (val) {
        setState(() => password = val);
      },
    );
  }

  /// Button for signing up with email and password. It first checks validation through _formKey
  /// and then calls the [AuthenticationService] class to register the user.
  /// If successful the user is registered and redirected to the home page.
  ElevatedButton _signUpButton() {
    return ElevatedButton(
      child: const Text('Sign up!'),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          dynamic result =
              await _auth.registerWithEmailAndPassword(email, password);
          if (result == null) {
            setState(() => ScaffoldMessenger.of(context)
                .showSnackBar(DefaultSnackBar(message: 'Please supply a valid email')));
          }
        }
      },
    );
  }

  /// Button to sign up with Google.
  SignInButton _googleSignUpButton() {
    return SignInButton(
      Buttons.Google,
      text: 'Sign up with Google',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      onPressed: () async {
        //TODO implement google sign up.
      },
    );
  }

  /// Button which navigates to the sign in page, utilizing the [toggleView] function.
  ElevatedButton _signInButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      onPressed: () async {
        widget.toggleView();
      },
      child: const Text('Sign in'),
    );
  }
}
