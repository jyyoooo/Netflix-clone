import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix/core/constants/colors.dart';
import 'package:netflix/core/constants/constant.dart';
import 'package:netflix/core/constants/common_styles.dart';
import 'package:netflix/view/mainpage/screen_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/netflix_background.jpg'),
                fit: BoxFit.fitHeight)),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: SvgPicture.asset(
                  'assets/netflix-2-logo-svgrepo-com.svg',
                  height: 150,
                  color: netflixRed,
                ),
              ),
              TextFormField(
                  decoration: CommonStyle.textField(hintText: 'Email'),
                  controller: emailController),
              kHeight,
              TextFormField(
                  decoration: CommonStyle.textField(hintText: 'Password'),
                  controller: passwordController),
              kHeight,
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ScreenMain();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: netflixRed,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              )
            ],
          ),
        )),
      ),
    );
  }
}
