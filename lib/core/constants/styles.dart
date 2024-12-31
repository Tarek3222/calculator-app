import 'package:flutter/material.dart';

class Styles {
  static TextStyle font16Medium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }

  static TextStyle font22SemiBold(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }

  static TextStyle font50Regular(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 50),
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