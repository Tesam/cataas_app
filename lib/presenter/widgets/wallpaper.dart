import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Wallpaper extends StatelessWidget {
  const Wallpaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget firstRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset('assets/cat_icon_1.svg'),
        SvgPicture.asset('assets/cat_icon_2.svg'),
        SvgPicture.asset('assets/cat_icon_3.svg'),
      ],
    );
    Widget dividerRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset('assets/cat_icon_4.svg'),
        SvgPicture.asset('assets/cat_icon_5.svg'),
      ],
    );
    Widget secondRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset('assets/cat_icon_6.svg'),
        SvgPicture.asset('assets/cat_icon_7.svg'),
        SvgPicture.asset('assets/cat_icon_8.svg'),
      ],
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        firstRow,
        dividerRow,
        secondRow,
        dividerRow,
        firstRow,
        dividerRow,
        secondRow,
      ],
    );
  }
}
