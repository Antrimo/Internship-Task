import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/color/theme.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey _increasebutton = GlobalKey();
  final GlobalKey _decreasebuttom = GlobalKey();

  int _counter = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _createTutorial();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: splash,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Center(
                  child: Lottie.asset(
                    "assets/frame.json",
                    width: 200,
                    height: 200,
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      '$_counter',
                      style: const TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  key: _increasebutton,
                  onTap: _incrementCounter,
                  child: Lottie.asset(
                    "assets/plus.json",
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(width: 20.0),
                GestureDetector(
                  key: _decreasebuttom,
                  onTap: _decrementCounter,
                  child: Lottie.asset(
                    "assets/minus.json",
                    width: 90,
                    height: 90,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createTutorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool tutorialShown = prefs.getBool('tutorialShown') ?? false;

    if (!tutorialShown) {
      final targets = [
        TargetFocus(
          identify: 'editButton',
          keyTarget: _increasebutton,
          alignSkip: Alignment.bottomCenter,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              child: Text(
                'Press this button to increment the counter value',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        TargetFocus(
          identify: 'settingsButton',
          keyTarget: _decreasebuttom,
          alignSkip: Alignment.bottomCenter,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              child: Text(
                'Press this button to decrement the counter value',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ];

      final tutorial = TutorialCoachMark(
        targets: targets,
        onFinish: () {
          prefs.setBool('tutorialShown', true);
        },
      );

      Future.delayed(const Duration(milliseconds: 500), () {
        tutorial.show(context: context);
      });
    }
  }
}
