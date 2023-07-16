import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/Helpers/NavigatorHelper.dart';
import 'package:quran_app/Screens/Soura.dart';

import '../Widgets/AyahNumberWidget.dart';

class Home extends StatefulWidget {
  final List<dynamic> data;
  const Home(this.data, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with NavigatorHelper {
  late List souraNames = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.data.length; i++) {
      if (!souraNames.contains(widget.data[i]['sura_name_ar'])) {
        souraNames.add(widget.data[i]['sura_name_ar']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF0D883),
        title: Text(appLocale.fhrsAlSour,
            style: const TextStyle(color: Colors.black)),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                List<String> sora = [];
                for (int i = 1; i <= widget.data.length; i++) {
                  if (widget.data[i]["sura_no"] == index + 1) {
                    sora.add(widget.data[i]['aya_text']);
                  } else if (widget.data[i]["sura_no"] > index + 1) {
                    break;
                  }
                }
                jump(context, Soura(sora));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                width: double.infinity,
                height: 98.h,
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? const Color(0xffFDFFC1) : null,
                ),
                child: Row(
                  children: <Widget>[
                    AyahNumberWidget(index + 1),
                    SizedBox(width: 16.w),
                    Text(souraNames[index]),
                  ],
                ),
              ),
            );
          },
          itemCount: souraNames.length),
    );
  }
}
