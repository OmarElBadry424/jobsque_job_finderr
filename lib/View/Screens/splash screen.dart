
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobsque/on%20Boarding/onBoarding%20screen.dart';

import '../../Local/cache helper.dart';
import '../../Local/enum.dart';
import '../../router/app_route.dart';
class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  @override
  void initState(){
    controller= AnimationController(vsync: this,
      duration: Duration(milliseconds: 1200),);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    Timer(Duration(seconds: 5),(){
      final token=CashHelper.getString(key: MySharedKeys.token);
      final onBoarding=CashHelper.getString(key: MySharedKeys.onboarding);
      final rememberMe=CashHelper.getString(key: MySharedKeys.rememberMe);


      if(token!.isNotEmpty && rememberMe=='true'){
        Navigator.pushNamedAndRemoveUntil(context, AppRoute.layoutScreen, (route) => false);

      }
      else if(token!.isNotEmpty && rememberMe=='false'){
        Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
      }
      else if(token!.isEmpty && onBoarding=='true'){
        Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
      }
      else{
        Navigator.pushNamedAndRemoveUntil(context, AppRoute.onBoardingScreen, (route) => false);

      }
      // Navigator.pushAndRemoveUntil
      //   (context , MaterialPageRoute(builder: (context)=> OnboardingScreen()), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash/Blur.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:Image.asset("assets/images/splash/Property 1=Medium.png"),),


    );
  }
}