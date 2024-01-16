import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/mainpage/screen_main.dart';
import 'package:netflix/widgets/common_styles.dart';

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
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        title: SvgPicture.asset(
          'assets/netflix-2-logo-svgrepo-com.svg',
          height: 140,
          color: Colors.red,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                decoration: CommonStyle.textField(),
                controller: emailController),
            kHeight,
            TextFormField(
                decoration: CommonStyle.textField(),
                controller: passwordController),
            kHeight,
            Container(
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
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
