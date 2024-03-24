import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task/color/theme.dart';
import 'package:task/navigation/navbar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Nav()),
        );
      },
      child: Scaffold(
        backgroundColor: splash,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'assets/splash.json',
                height: 300,
                width: 300,
              ),
            ),
            const Text(
              "ONEAPE",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
