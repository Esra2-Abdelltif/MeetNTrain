import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_n_train_app/core/utils/color_manager.dart';
import 'package:meet_n_train_app/core/utils/font_manager.dart';

ThemeData lightthemes = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor:AppColor.white,
  primaryColor: AppColor.primaryColor,
  primaryColorDark: AppColor.primaryColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleSpacing: 15,
    iconTheme: IconThemeData(color: AppColor.black),
    backgroundColor:AppColor.white,
    elevation: 0,
    titleTextStyle: const TextStyle(
      color:Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: FontConstants.fontFamily
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:Colors.transparent,
      statusBarIconBrightness:Brightness.dark,

    ),
  ),

  iconTheme: IconThemeData(
      color:AppColor.primaryColor,

  ),

  textTheme: const TextTheme(

    bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.black),
    bodyText2:  TextStyle(fontSize: 16, color: Colors.black),
    headline1:TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w600,),
    headline2: TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98)),

  ),


  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
              color: AppColor.white, fontSize: 16),
          primary: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)))),
  cardTheme: CardTheme(
      color: AppColor.white,
      shadowColor: AppColor.grey,
     ),

  buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: AppColor.grey,
      buttonColor: AppColor.primaryColor,
      splashColor: AppColor.primaryColor),


);