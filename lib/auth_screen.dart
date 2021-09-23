import 'package:auth_animation/constants.dart';
import 'package:auth_animation/widgets/login_form.dart';
import 'package:auth_animation/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It provide us screen height and width
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Login
          Positioned(
            // I use 88% width for login
            width: _size.width * 0.88, // 88%
            height: _size.height,
            child: Container(
              color: login_bg,
              child: LoginForm(),
            ),
          ),
          Positioned(
            top: _size.height * 0.1,
            left: 0,
            right: _size.width * 0.06,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white60,
              child: SvgPicture.asset(
                "assets/images/animation_logo.svg",
                color: login_bg,
              ),
            ),
          ),
          // I shift it 6% to eight because our this sign up bar take 12% width
          Positioned(
            width: _size.width,
            bottom: _size.height * 0.1,
            right: _size.width * 0.06,
            child: SocalButtons(),
          ),
        ],
      ),
    );
  }
}
