import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Styling on Widget {
  symmetricPadding({double? horizontal, double? vertical}) => Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontal?.w ?? 0, vertical: vertical?.h ?? 0),
      child: this);
  onlyPadding({double? t, double? b, double? l, double? r}) => Padding(
      padding: EdgeInsets.only(
          top: t?.h ?? 0, bottom: b?.h ?? 0, left: l?.w ?? 0, right: r?.w ?? 0),
      child: this);
}
