import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surfs_up/services/authentication_service.dart';
import 'package:surfs_up/shared/constants/colors.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:surfs_up/shared/widgets/snack_bar_widget.dart';
import 'package:surfs_up/shared/constants/text_input_decoration.dart';

/// Class which displays the Sign in page, utilizing the [AuthenticationService] class.
class SignInPage extends StatefulWidget {
  final Function toggleView;

  const SignInPage({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset('assets/images/surfs_up_logo.png', scale: 1.5),
                const SizedBox(height: 10.0),
                const Text('Log in to your account',
                    style: TextStyle(color: Colors.white, fontSize: 25.0)),
                const SizedBox(height: 20.0),
                _emailTextFormField(),
                const SizedBox(height: 30.0),
                _passwordTextFormField(),
                const SizedBox(height: 20.0),
                _signInButton(),
                const Text('or', style: TextStyle(color: Colors.white)),
                _googleSignInButton(),
                const SizedBox(height: 50.0),
                const Text('New here? Sign up now!',
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10.0),
                _signUpButton(),
                if (kDebugMode) const SizedBox(height: 10.0),
                _signInAnonymously(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Text form field for the email input which changes state and updates the email variable.
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

  /// Text form field for the password input which changes state and updates the password variable.
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

  /// Button which signs in the user. First it checks validation through _formKey.
  /// These validations is set by the validators in the text form fields.
  /// Secondly, it calls the signInWithEmailAndPassword function from the [AuthenticationService] class,
  /// and if successful it dynamically changes the AppUser and navigates to the Home page.
  ElevatedButton _signInButton() {
    return ElevatedButton(
      child: const Text('Sign In'),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          dynamic result =
              await _auth.signInWithEmailAndPassword(email, password);
          if (result == null) {
            setState(() => ScaffoldMessenger.of(context)
                .showSnackBar(DefaultSnackBar(message: 'Invalid Credentials',)));
          }
        }
      },
    );
  }

  /// Button which signs in the user with Google.
  SignInButton _googleSignInButton() {
    return SignInButton(
      Buttons.Google,
      text: 'Sign in with Google',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      onPressed: () async {
        dynamic result = await _auth.signInWithGoogle();
        // if (result == null) {
        //   setState(() => ScaffoldMessenger.of(context)
        //       .showSnackBar(DefaultSnackBar(message: 'Could not sign in with google',)));
        // }
      },
    );
  }

  /// Button which navigates to the Sign up page, utilizing the [toggleView] function.
  ElevatedButton _signUpButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      onPressed: () async {
        widget.toggleView();
      },
      child: const Text('Sign up'),
    );
  }

  /// Button to sign in anonymously when in development mode.
  ElevatedButton _signInAnonymously() {
    return ElevatedButton(
        onPressed: () async {
          dynamic result = await _auth.signInAnonymously();
          if (result == null) {
            print('Error signing in anonymously');
          }
        },
        child: const Text('Sign in anonymously (Dev only)'));
  }
}
