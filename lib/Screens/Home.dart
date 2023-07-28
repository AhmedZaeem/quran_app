import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/Helpers/NavigatorHelper.dart';
import 'package:quran_app/Modules/Chapters.dart';

import '../Modules/Ayat.dart';
import '../Widgets/AyahNumberWidget.dart';
import 'Soura.dart';

class Home extends StatefulWidget {
  final List<Chapters> data;
  const Home(this.data, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with NavigatorHelper {
  bool loading = false;
  @override
  void initState() {
    super.initState();
    // for (int i = 0; i < widget.data.length; i++) {
    //   if (!souraNames.contains(widget.data[i]['sura_name_ar'])) {
    //     souraNames.add(widget.data[i]['sura_name_ar']);
    //   }
    // }
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
      body: Stack(
        children: [
          loading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox.shrink(),
          ListView.builder(
              physics: loading ? const NeverScrollableScrollPhysics() : null,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    // List<String> sora = [];
                    // for (int i = 1; i <= widget.data.length; i++) {
                    //   if (widget.data[i]["sura_no"] == index + 1) {
                    //     sora.add(widget.data[i]['aya_text']);
                    //   } else if (widget.data[i]["sura_no"] > index + 1) {
                    //     break;
                    //   }
                    // }
                    // jump(context, Soura([]));
                    setState(() {
                      loading = true;
                    });
                    var response = await http.get(Uri.parse(
                        'https://api.quran.com/api/v4/quran/verses/uthmani?chapter_number=${index + 1}&page_number=${widget.data[index].pages![0]}'));
                    var aya = Ayat.fromJson(jsonDecode(response.body));
                    setState(() {
                      loading = false;
                    });
                    if (mounted) {
                      jump(context, Soura([aya.verses!], widget.data[index]));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    width: double.infinity,
                    height: 98.h,
                    decoration: BoxDecoration(
                      color: loading
                          ? Colors.grey.withOpacity(.5)
                          : index % 2 == 0
                              ? const Color(0xffFDFFC1)
                              : null,
                    ),
                    child: Row(
                      children: <Widget>[
                        AyahNumberWidget(index + 1),
                        SizedBox(width: 16.w),
                        Text(widget.data[index].nameArabic ?? ''),
                      ],
                    ),
                  ),
                );
              },
              itemCount: widget.data.length),
        ],
      ),
    );
  }
}
