import 'package:flutter/material.dart';
import 'package:recruitease_app/widgets/app_export.dart';

class AppStyle {
  static TextStyle txtPlusJakartaSansRomanRegular13 = TextStyle(
    color: ColorConstant.gray500,
    fontSize: getFontSize(
      13,
    ),
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPlusJakartaSansRomanRegular14 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPlusJakartaSansRomanSemiBold24 = TextStyle(
    color: ColorConstant.gray900,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w600,
  );
}
