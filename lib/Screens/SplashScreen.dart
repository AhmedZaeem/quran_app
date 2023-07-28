import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/Helpers/NavigatorHelper.dart';

import '../Modules/AllSourModule.dart';
import 'Home.dart';

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
    // var response =
    //     await rootBundle.loadString('assets/json/hafs_smart_v8.json');
    // final data = await jsonDecode(response);
    // jump(context, Home(data), replace: true);
    var response = await http
        .get(Uri.parse('https://api.quran.com/api/v4/chapters?language=ar'));
    var sour = AllSourModule.fromJson(jsonDecode(response.body));
    if (mounted) {
      jump(context, Home(sour.chapters!), replace: true);
    }
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
