import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTextStyle {
  static TextStyle s10Reglur(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: .w400,
    fontStyle: .normal,
    color: AppColors.secondaryColor,
  );

  static TextStyle s20w600(BuildContext context) => TextStyle(
    fontWeight: .w600,
    fontSize: 20,
    fontStyle: .normal,
    color: AppColors.primaryColor,
  );

  static TextStyle s20bold(BuildContext context) => TextStyle(
    fontSize: 20,
    fontWeight: .bold,
    color: Colors.black,
    fontStyle: .normal,
  );

  static TextStyle s18colorWhite(BuildContext context) => TextStyle(
    fontSize: 13,
    fontWeight: .w400,
    color: Colors.white,
    fontStyle: .normal,
  );

  // ===== App Bar & Screen Titles =====
  static const TextStyle screenTitle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  ); // TextStyle

  static const TextStyle pageTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xff153c62),
  ); // TextStyle

  // ===== Section Headings =====
  static const TextStyle sectionHeading = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Color(0xff153c62),
  ); // TextStyle

  static const TextStyle priceText = TextStyle(

    fontSize: 25,
    fontWeight: FontWeight.normal,
    color: Colors.grey,

  );
  static const TextStyle bodyText = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle desc = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
}
