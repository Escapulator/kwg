import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kwgg/Constants/app_assets.dart';
import 'package:kwgg/Constants/app_colors.dart';
import 'package:kwgg/Screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Home.routeName, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Center(
        child: Hero(tag: 'logo', child: Image.asset(AppAssets.logo)),
      ),
    );
  }
}
