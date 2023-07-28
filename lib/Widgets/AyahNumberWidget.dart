import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AyahNumberWidget extends StatelessWidget {
  final int number;
  const AyahNumberWidget(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/images/ayahNumber.svg'),
        PositionedDirectional(
          start: number < 10
              ? 14.w
              : number >= 100
                  ? 8.w
                  : 12.w,
          top: 13.5.h,
          child: Text(
            '$number',
            style: TextStyle(
                color: const Color(0xff2877EE),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
