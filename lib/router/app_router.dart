

import 'package:flutter/material.dart';
import 'package:jobsque/Register/register%20job%20screen.dart';
import '../Register/LayoutScreen.dart';
import '../login/Login.dart';
import '../on Boarding/onBoarding screen.dart';
import '../View/Screens/splash screen.dart';
import '../View/Screens/register_screen.dart';
import '../apply_job/view/screens/apply_job_screen.dart';
import '../apply_job/view/screens/apply_successfully.dart';
import '../apply_job/view/screens/job_details.dart';
import '../apply_job/view/widgets/image_screen.dart';
import '../apply_job/view/widgets/pdf_screen.dart';
import '../forgot_password/view/screens/checkmail_password_screen.dart';
import '../forgot_password/view/screens/create_new_password.dart';
import '../forgot_password/view/screens/forgotpassword_screen.dart';
import '../forgot_password/view/screens/success_ForgotPassword_screen.dart';
import '../home/view/screens/home_screen.dart';
import '../View/Screens/location screen.dart';
import '../notification/view/notification_screen.dart';
import '../profile/model/pdf_args.dart';
import '../profile/view/screen/complete_profile_screen.dart';
import '../profile/view/screen/edit_details_screen.dart';
import '../profile/view/screen/education_screen.dart';
import '../profile/view/screen/experience_screen.dart';
import '../profile/view/screen/help_center_screen.dart';
import '../profile/view/screen/language_screen.dart';
import '../profile/view/screen/login_security_screen.dart';
import '../profile/view/screen/login_security_screens/change_password.dart';
import '../profile/view/screen/login_security_screens/email_address_screen.dart';
import '../profile/view/screen/login_security_screens/phone_number_screen.dart';
import '../profile/view/screen/login_security_screens/two_step_verification_1.dart';
import '../profile/view/screen/login_security_screens/two_step_verification_2.dart';
import '../profile/view/screen/login_security_screens/two_step_verification_3.dart';
import '../profile/view/screen/login_security_screens/two_step_verification_4.dart';
import '../profile/view/screen/notification_settings_screen.dart';
import '../profile/view/screen/portfolio_screen.dart';
import '../profile/view/screen/privacy_policy_screen.dart';
import '../profile/view/screen/terms_conditions_screen.dart';
import '../saved_job/model/favourite_model.dart';
import '../search/view/screens/search_screen.dart';
import '../Register/success register.dart';
import 'app_route.dart';

Route? onGenerateRouter(RouteSettings settings){
  switch(settings.name){
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (_)=> const SplashScreen());
    case AppRoute.onBoardingScreen:
      return  MaterialPageRoute(builder: (_) => const OnboardingScreen());

    case AppRoute.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());


    case AppRoute.registerScreen:
      return MaterialPageRoute(builder: (_) =>   RegisterScreen());


    case AppRoute.forgetPasswordScreen  :
      return   MaterialPageRoute(builder: (_) => ForgotPasswordScreen());

    case AppRoute.checkEmailForgetPasswordScreen  :
      return MaterialPageRoute(builder: (_) => const CheckMailForgotPasswordScreen());

    case AppRoute.createNewPasswordScreen  :
      return MaterialPageRoute(builder: (_) => const CreateNewPassword());

    case AppRoute.successForgetPasswordScreen  :
      return MaterialPageRoute(builder: (_) => const SuccessForgotPasswordScreen());


    case AppRoute.registerScreen:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());

    case AppRoute.registerWorkScreen:
      return MaterialPageRoute(builder: (_) => const RegisterJobScreen());

    case AppRoute.locationRegisterScreen:
      return MaterialPageRoute(builder: (_) =>  const LocationRegisterScreen());

    case AppRoute.successRegisterScreen:
      return MaterialPageRoute(builder: (_) => const SuccessRegisterScreen());


    case AppRoute.layoutScreen:
      return MaterialPageRoute(builder: (_)=>const LayoutScreen());

    case AppRoute.homeScreen:
      return MaterialPageRoute(builder: (_) => HomeScreen());

    case AppRoute.notificationScreen:
      return MaterialPageRoute(builder: (_) =>  const NotificationScreen());

    case AppRoute.jobDetailsScreen:
      final args = settings.arguments as JobData;
      return MaterialPageRoute(builder: (_) =>  JobDetails(jobData: args,));

    case AppRoute.applyJobScreen:
      final args = settings.arguments as JobData;
      return MaterialPageRoute(builder: (_) =>  ApplyJob(jobData: args,));

    case AppRoute.applyJobSuccessfullyScreen:
      return MaterialPageRoute(builder: (_) => const  ApplyJobSuccessfully());

    case AppRoute.pdfScreen:
      final args = settings.arguments as PdfScreenArguments;

      return  MaterialPageRoute(builder: (_) =>  PDFScreen(text: args.text, selectedCV: args.file,));

    case AppRoute.imageScreen:
      return  MaterialPageRoute(builder: (_) =>  ImageScreen());

    case AppRoute.searchScreen:
      return MaterialPageRoute(builder: (_) => SearchScreen());

    case AppRoute.editDetailsScreen:
      return  MaterialPageRoute(builder: (_) =>  EditDetalisScreen());

    case AppRoute.portfolioScreen:
      return MaterialPageRoute(builder: (_) =>  const PortfolioScreen());

    case AppRoute.languageScreen:
      return MaterialPageRoute(builder: (_) =>  const LanguageScreen());

    case AppRoute.notificationsSettingsScreen:
      return MaterialPageRoute(builder: (_) =>  const NotificationsSettingsScreen());

    case AppRoute.privacyAndPolicyScreen:
      return MaterialPageRoute(builder: (_) => const PrivacyAndPolicyScreen());

    case AppRoute.helpCenterScreen:
      return MaterialPageRoute(builder: (_) =>  HelpCenterScreen());

    case AppRoute.termsAndConditionsScreen:
      return MaterialPageRoute(builder: (_) =>   const TermsAndConditionsScreen());

    case AppRoute.loginAndSecurityScreen:
      return  MaterialPageRoute(builder: (_) =>   const LoginAndSecurityScreen());

    case AppRoute.emailAddressScreen:
      return MaterialPageRoute(builder: (_) =>  EmailAddressScreen());

    case AppRoute.phoneNumberScreen:
      return MaterialPageRoute(builder: (_) =>  PhoneNumberScreen());

    case AppRoute.changePasswordScreen:
      return MaterialPageRoute(builder: (_) =>   ChangePasswordScreen());

    case AppRoute.twoStepVerification1:
      return MaterialPageRoute(builder: (_) =>   TwoStepVerification1());

    case AppRoute.twoStepVerification2:
      return MaterialPageRoute(builder: (_) =>   TwoStepVerification2());

    case AppRoute.twoStepVerification3:
      return MaterialPageRoute(builder: (_) =>   TwoStepVerification3());

    case AppRoute.twoStepVerification4:
      return MaterialPageRoute(builder: (_) =>   TwoStepVerification4());
    case AppRoute.experienceScreen:
      return MaterialPageRoute(builder: (_) =>  const ExperienceScreen());
    case AppRoute.educationScreen:
      return MaterialPageRoute(builder: (_) =>   const EducationScreen());
    case AppRoute.completeProfileScreen:

      return MaterialPageRoute(builder: (_) =>   const CompleteProfileScreen());


    default:
      return null;

  }

}