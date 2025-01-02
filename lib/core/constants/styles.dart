import 'package:flutter/material.dart';

class Styles {
  static TextStyle font16Medium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }

  static TextStyle font24SemiBold(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }

  static TextStyle font60Regular(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 60),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }

  static TextStyle font40Regular(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 40),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 550;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 2300;
  }
}
