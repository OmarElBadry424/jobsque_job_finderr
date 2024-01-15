import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/Local/enum.dart';
import 'package:jobsque/theme/theme_state.dart';

import '../Local/cache helper.dart';
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context)=>BlocProvider.of(context);
  bool isDarkTheme = false;
  void changeAppTheme(){
    isDarkTheme =!isDarkTheme;
    emit(ChangeAppTheme());
  }
  void getAppTheme(){
    CashHelper.getBoolean(key: MySharedKeys.isDark);
  }
}
