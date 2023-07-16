import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Soura extends StatefulWidget {
  final List<String> sora;
  const Soura(this.sora, {super.key});

  @override
  State<Soura> createState() => _SouraState();
}

class _SouraState extends State<Soura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(children: [
          SizedBox(height: 35.h),
          Text.rich(
            TextSpan(
                children: List.generate(
                    widget.sora.length,
                    (index) => TextSpan(
                        text: widget.sora[index],
                        style: TextStyle(fontSize: 24.sp)))),
          ),
        ]),
      ),
    );
  }
}
