import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/on%20Boarding/on%20Boarding%20Cubit/on_boarding_cubit.dart';
import 'package:jobsque/profile/view_model/profile_cubit.dart';
import 'package:jobsque/router/app_router.dart';
import 'package:jobsque/saved_job/view_model/favourite_cubit.dart';
import 'package:jobsque/search/view_model/search_cubit.dart';
import 'package:jobsque/theme/app%20theme.dart';
import 'package:jobsque/theme/theme_cubit.dart';
import 'package:jobsque/theme/theme_state.dart';
import 'package:sizer/sizer.dart';
import 'Local/cache helper.dart';
import 'apply_job/view_model/job_cubit.dart';
import 'Register/register_cubit.dart';
import 'login/Login cubit.dart';
import 'cubit/bloc observer.dart';
import 'Local/dio helper.dart';
import 'home/view_model/home_cubit.dart';
import 'Layout/layout_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  CashHelper.init();
  DioHelper.init();
  runApp(
      EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'SA')],
        path: 'assets/translation',
        // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(),
            ),

            BlocProvider<RegisterCubit>(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => OnBoardingCubit(),
            ),

            BlocProvider(
              create: (context) => ThemeCubit(),
            ),

            BlocProvider<LayoutCubit>(
              create: (context) => LayoutCubit(),
            ),

            BlocProvider<RegisterCubit>(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => HomeCubit()
                ..getAllRecentJobs()..getAllSuggestJobs()..getFavouriteJobs(),
            ),
            BlocProvider(
              create: (context) => JobCubit(),
            ),
            BlocProvider(
              create: (context) => FavouriteCubit(),
            ),
            BlocProvider(
              create: (context) => SearchCubit(),
            ),

            BlocProvider(
                create: (context) => ProfileCubit()
                  ..getProfileDetailsAndPortfolios()..getProfileNameAndEmail()

            ),



          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,

                theme:
                ThemeCubit
                    .get(context)
                    .isDarkTheme ?
                Themes.Darktheme : Themes.ligththeme,

                onGenerateRoute: onGenerateRouter,

              );
            },
          ),
        );
      },

    );
  }
}



