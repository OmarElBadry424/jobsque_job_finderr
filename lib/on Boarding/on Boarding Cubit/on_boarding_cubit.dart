import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  static OnBoardingCubit get(context)=> BlocProvider.of(context);
  final controller = PageController();
  bool show= false;
  void changePageView(int index) {
    if (index == 2) {
      show = true;
      emit(ChangePageViewState());
    } else {
      show = false;
      emit(ChangePageViewState());
    }
  }

}
