import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/Modules/Verses.dart';

import '../Modules/Ayat.dart';
import '../Modules/Chapters.dart';

class Soura extends StatefulWidget {
  final List<List<Verses>> sora;
  final Chapters chapter;
  const Soura(this.sora, this.chapter, {super.key});

  @override
  State<Soura> createState() => _SouraState();
}

class _SouraState extends State<Soura> {
  @override
  void initState() {
    super.initState();
    if (widget.chapter.pages![0] != widget.chapter.pages![1]) {
      getNextPage(widget.chapter.pages![0] + 1);
    }
  }

  Future<void> getNextPage(int page) async {
    var response = await http.get(Uri.parse(
        'https://api.quran.com/api/v4/quran/verses/uthmani?page_number=$page'));
    var aya = Ayat.fromJson(jsonDecode(response.body));
    widget.sora.add(aya.verses!);
  }

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            page = value;
          });
          if (page + widget.chapter.pages![0] != widget.chapter.pages![1]) {
            getNextPage(page + widget.chapter.pages![0] + 1);
          }
        },
        itemCount: widget.chapter.pages![0] == widget.chapter.pages![1]
            ? 1
            : (widget.chapter.pages![1] - widget.chapter.pages![0]),
        itemBuilder: (context, index) {
          return Column(
            children: [
              widget.sora[page][index].verseKey!
                          .replaceAll('${widget.chapter.id}:', '') ==
                      '1'
                  ? Stack(
                      children: [
                        Image.asset('assets/images/headOfSora.png'),
                        Center(
                          child: Text(
                            widget.chapter.nameArabic ?? '',
                            style: TextStyle(fontSize: 24.sp),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              widget.chapter.bismillahPre! &&
                      widget.sora[page][index].verseKey!
                              .replaceAll('${widget.chapter.id}:', '') ==
                          '1'
                  ? Text(
                      'بسم الله الرحمن الرحيم',
                      style: TextStyle(
                        fontSize: 24.sp,
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(height: 16.h),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: List.generate(
                    widget.sora[page].length,
                    (index) => TextSpan(
                      text:
                          ' ${widget.sora[page][index].textUthmani} ﴿${widget.sora[page][index].verseKey!.replaceFirst('${widget.chapter.id}:', '')}﴾',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Text('${page + widget.chapter.pages![0]}'),
              )
            ],
          );
        },
      ),
    );
  }
}
