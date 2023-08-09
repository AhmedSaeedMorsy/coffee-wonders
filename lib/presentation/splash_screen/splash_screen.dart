// ignore_for_file: file_names

import 'dart:async';
import 'package:coffee_wonders/app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/resources/assets_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/values_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  final dateNow = DateTime.now();

  void _startDelay() {
    _timer = Timer(
      const Duration(
        seconds: AppIntDuration.duration3,
      ),
      _nextScreen,
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SizedBox(
        child: Center(
          child: Image(
            width: AppSize.s250.w,
            image: const AssetImage(
              AssetsManager.logo,
            ),
          ),
        ),
      ),
    );
  }

  void _nextScreen() {
    Navigator.pushReplacementNamed(
      context,
      Routes.layoutRoute,
    );
  }
}
