// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'api.dart';
import 'colors.dart';
import 'icons.dart';
import 'model.dart';
import 'sharedpreferences.dart';
import 'textstyle.dart';
import 'widgets/alertdialog.dart';

main() => runApp(const MyApp());

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

  Future<ApiRespond> testAPI() async {
    ApiRespond respond = await AirvisualApiHub().supportedcountries();
    return respond;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(
                onPressed: () async {},
                child: Text(
                  "test shared preferences".toUpperCase(),
                  style: kanitr(c: ColorApp.black),
                )),
            TextButton(
                onPressed: () {
                  testAPI().then((value) => alertDialog(context, true,
                      title: "test api ${value.status.toString()}".toUpperCase(),
                      content: [Text(value.status.toString().toUpperCase())]));
                },
                child: Text(
                  "test api".toUpperCase(),
                  style: kanitr(c: ColorApp.black),
                )),
          ],
        ),
      ),
    );
  }
}
