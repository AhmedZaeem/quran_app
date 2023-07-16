import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/SplashScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final SystemUiOverlayStyle _style =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_style);
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('ar')],
          locale: const Locale('ar'),
          home: const SplashScreen(),
          theme: ThemeData(
            fontFamily: 'HafsSmart',
            scaffoldBackgroundColor: const Color(0xffFEFFDD),
            colorScheme: Theme.of(context).colorScheme.copyWith(),
          ),
        );
      },
    );
  }
}
