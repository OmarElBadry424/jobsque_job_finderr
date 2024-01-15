import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:jobsque/theme/app%20colors.dart';

class Themes{
  static ThemeData ligththeme = ThemeData(
    colorScheme: ColorScheme.light(
      // primary: AppTheme.primaryColor
    ),
    iconTheme: const IconThemeData(
      color: AppTheme.grey
    ),
    buttonTheme: const  ButtonThemeData(
      buttonColor: AppTheme.prim
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppTheme.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppTheme.primaryColor
      ),
    ),
    // dialogBackgroundColor: Colors.transparent,
   // toggleButtonsTheme: ToggleButtonsThemeData(
   //   selectedBorderColor: Colors.transparent,
   //   borderColor: Colors.transparent,
   //   fillColor: AppTheme.black,
   // ),
    checkboxTheme: CheckboxThemeData(
       checkColor: MaterialStateProperty.all(AppTheme.white),
       fillColor: MaterialStateProperty.all(AppTheme.white),
    ),
    textTheme: TextTheme(
    displayLarge:
    TextStyle(
    color:  AppTheme.neutral9,

    ),

    ),
  );
  static ThemeData Darktheme = ThemeData(
    colorScheme: ColorScheme.light(
        primary: AppTheme.black
    ),
    iconTheme: const IconThemeData(
        color: AppTheme.grey
    ),
    buttonTheme: const  ButtonThemeData(
        buttonColor: AppTheme.prim
    ),
    scaffoldBackgroundColor: AppTheme.black,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppTheme.black,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppTheme.black
      ),
    ),
    dialogBackgroundColor: AppTheme.greyBetween,
    toggleButtonsTheme: ToggleButtonsThemeData(
      selectedBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      fillColor: AppTheme.black,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppTheme.white),
      fillColor: MaterialStateProperty.all(AppTheme.white),
    ),

    textTheme: TextTheme(
     headline4: display1,
     headline5: headline,
     headline6: title,
      subtitle2: subtitle,
      bodyText2: body2,
      bodyText1: body1,
      caption: caption,
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.white
      ),
      labelStyle: TextStyle(
        color: Colors.white
      ),
      ),



  );

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle( // h4 -> display1
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: Colors.white,
  );

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeight.w200,
    fontSize: 20,
    letterSpacing: 0.27,
    color: Colors.white,
  );

  static const TextStyle title = TextStyle( // h6 -> title
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 26,
    letterSpacing: 0.18,
    color: Colors.white,
  );

  static const TextStyle subtitle = TextStyle( // subtitle2 -> subtitle
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: Colors.white,
  );

  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: Colors.white,
  );

  static const TextStyle body1 = TextStyle( // body2 -> body1
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: Colors.white,
  );

  static const TextStyle caption = TextStyle( // Caption -> caption
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: Colors.white, // was lightText
  );


}