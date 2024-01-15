import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/on%20Boarding/on%20Boarding%20Cubit/on_boarding_state.dart';
import 'package:jobsque/theme/app%20colors.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../View/Widgets/Default Button.dart';
import '../Local/cache helper.dart';
import '../Local/enum.dart';
import '../router/app_route.dart';
import 'onBoadring item.dart';
import '../Model/onBoarding model.dart';
import 'on Boarding Cubit/on_boarding_cubit.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnBoardingCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = OnBoardingCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: SvgPicture.asset("assets/images/auth/Logo (1).svg"),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: TextButton(onPressed: () {
              CashHelper.putString(key: MySharedKeys.onboarding, value: 'true');

              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.loginScreen, (route) => false);
            }, child: const Text("Skip",
            style: TextStyle(
              color: AppTheme.secondColor,
            ),)),
          ),
        ],
      ),
      body: Column(
        children: [

          Expanded(
            child: PageView.builder(
              controller: cubit.controller,
              itemBuilder: (context, index) {
                return BoardingItem(model: OnboardingModel.boardingData[index]);
              },
              itemCount: OnboardingModel.boardingData.length,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                cubit.changePageView(index);
              },
            ),
          ),
          SmoothPageIndicator(
              controller: cubit.controller, // PageController
              count: OnboardingModel.boardingData.length,
              effect: const SwapEffect(
                type: SwapType.yRotation,
                dotWidth: 8,
                dotHeight: 8,

              ), // your preferred effect
              onDotClicked: (index) {

              }
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 6, 24, 24),
            child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
              builder: (context, state) {
                return DefaultButton(() {
                  if (cubit.show) {
                    CashHelper.putString(key: MySharedKeys.onboarding, value: 'true');
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoute.loginScreen, (route) => false);
                  }
                  else {
                    cubit.controller.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  }
                },

                    cubit.show ? "Get Started" : "Next"

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
