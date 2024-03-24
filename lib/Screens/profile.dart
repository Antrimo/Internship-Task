import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task/color/theme.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 158, 230),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: splash,
        title: const Center(
          child: Text('Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              )),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              "assets/profile.json",
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
