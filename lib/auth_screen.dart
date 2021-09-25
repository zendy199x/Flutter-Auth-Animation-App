import 'package:auth_animation/constants.dart';
import 'package:auth_animation/widgets/login_form.dart';
import 'package:auth_animation/widgets/signup_form.dart';
import 'package:auth_animation/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isShowSignUp = false;

  @override
  Widget build(BuildContext context) {
    // It provide us screen height and width
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Lets animate the transition
          // Login
          AnimatedPositioned(
            duration: defaultDuration,
            // I use 88% width for login
            width: _size.width * 0.88, // 88%
            height: _size.height,
            left: _isShowSignUp ? -_size.width * 0.76 : 0,
            child: GestureDetector(
              onTap: () {
                // Just use 88% width for login
                setState(() {
                  _isShowSignUp = !_isShowSignUp;
                });
              },
              child: Container(
                color: login_bg,
                child: LoginForm(),
              ),
            ),
          ),

          // Sign up
          AnimatedPositioned(
            duration: defaultDuration,
            width: _size.width * 0.88,
            height: _size.height,
            left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
            child: Container(
              color: signup_bg,
              child: SignUpForm(),
            ),
          ),
          AnimatedPositioned(
            duration: defaultDuration,
            top: _size.height * 0.1,
            left: 0,
            right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white60,
              child: _isShowSignUp
                  ? SvgPicture.asset(
                      "assets/images/animation_logo.svg",
                      color: signup_bg,
                    )
                  : SvgPicture.asset(
                      "assets/images/animation_logo.svg",
                      color: login_bg,
                    ),
            ),
          ),
          // I shift it 6% to eight because our this sign up bar take 12% width
          AnimatedPositioned(
            duration: defaultDuration,
            width: _size.width,
            bottom: _size.height * 0.1,
            right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
            child: SocalButtons(),
          ),
        ],
      ),
    );
  }
}
