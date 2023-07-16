import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/Helpers/NavigatorHelper.dart';
import 'package:quran_app/Screens/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with NavigatorHelper {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var response =
        await rootBundle.loadString('assets/json/hafs_smart_v8.json');
    final data = await jsonDecode(response);
    jump(context, Home(data), replace: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/applogo.png',
              width: 140.w,
              height: 140.h,
            ),
            SvgPicture.asset('assets/images/quran.svg'),
            const Spacer(),
            const CircularProgressIndicator(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
