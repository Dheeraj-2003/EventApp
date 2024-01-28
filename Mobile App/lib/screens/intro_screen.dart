import 'package:event_hub/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  @override
  State<IntroScreen> createState() {
    return _IntroScreenState();
  }
}

class _IntroScreenState extends State<IntroScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 15),
      child: IntroductionScreen(
        key: _introKey,
        pages: [
          PageViewModel(
            title: 'Welcome to App',
            bodyWidget: const Center(
              child: CircleAvatar(
                radius: 100,
              ),
            ),
          ),
          PageViewModel(
            title: 'Welcome to App',
            body: 'Nice',
          ),
          PageViewModel(
            title: 'Welcome to App',
            body: 'Nice',
          )
        ],
        showSkipButton: true,
        skip: const Icon(Icons.skip_next),
        next: const Text("Next"),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
        onDone: () {
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
        onSkip: () {
          _introKey.currentState?.skipToEnd();
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    ));
  }
}
