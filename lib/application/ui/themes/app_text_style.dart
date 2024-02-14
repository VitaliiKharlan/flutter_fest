import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const button = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    height: 1.25,
    letterSpacing: 0.4,
  );

  static const bookText = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.0,
  );

  static const bookTextSmall = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static const snackText = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static const timeText = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    height: 1.375,
    letterSpacing: 0.0,
  );

  static const breakTimeElement = TextStyle(
    fontFamily: 'Lato',
    fontSize: 36,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    height: 1.33,
    letterSpacing: 0.0,
  );

  static const breakTimeElementSmall = TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.7,
    letterSpacing: 2.6,
  );

  static const speakerName = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: 0.0,
  );

  static const bookTextItalic = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 14,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    height: 24 / 16,
    letterSpacing: 0.0,
  );

  static const steinbeckNormalText = TextStyle(
    fontFamily: 'Parisienne',
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: 0.0,
  );

  static const steinbeckText = TextStyle(
    fontFamily: 'Parisienne',
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0.0,
  );

  static const steinbeckHeadItalic = TextStyle(
    fontFamily: 'Parisienne',
    fontSize: 36,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.0,
  );

  static const steinbeckHeadNormal = TextStyle(
    fontFamily: 'Parisienne',
    fontSize: 36,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.0,
  );

  static const dialogTitle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.0,
  );

  static const dialogAcceptAction = TextStyle(
    fontFamily: 'Lato',
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0.0,
  );

  static const dialogCancelAction = TextStyle(
    fontFamily: 'Lato',
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.0,
  );
}
