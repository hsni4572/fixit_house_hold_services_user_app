import 'package:fixit/extensions/size_config.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Sp {
  static Widget y(double val) {
    return SizedBox(height: val.h);
  }

  static Widget x(double val) {
    return SizedBox(width: val.w);
  }
}
