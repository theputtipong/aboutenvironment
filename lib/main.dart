import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'colors.dart';
import 'icons.dart';
import 'textstyle.dart';
import 'widgets/alertdialog.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: ColorApp.white, scaffoldBackgroundColor: ColorApp.white),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: buildSplash(),
          nextScreen: const MainScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.topToBottom,
          backgroundColor: ColorApp.white),
    );
  }

  buildSplash() {
    return FittedBox(
      fit: BoxFit.contain,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 100,
            child: Image.asset(
              GifIcon.globalwarming,
              fit: BoxFit.contain,
            ),
          ),
          FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: Text('welcome to "about the environment"', style: kanitr(c: ColorApp.turquoise)))
        ],
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(
                onPressed: () {
                  alertDialog(context, title: "Create DB");
                },
                child: Text(
                  "Test Create DB",
                  style: kanitr(c: ColorApp.black),
                )),
            TextButton(
                onPressed: () {
                  alertDialog(context, title: "Test Api");
                },
                child: Text(
                  "Test Api",
                  style: kanitr(c: ColorApp.black),
                ))
          ],
        ),
      ),
    );
  }
}
