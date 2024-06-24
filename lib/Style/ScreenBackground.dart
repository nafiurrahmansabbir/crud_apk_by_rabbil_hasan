import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Colors.dart';





SvgPicture ScreenBackground(context){
  return SvgPicture.asset(
    'assets/images/back_ground.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}
