import 'package:flutter_bloc/flutter_bloc.dart';
import 'Login state.dart';
import '../Local/dio helper.dart';
import '../Local/endpoints.dart';
import '../Model/login model.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isChecked= false;
  bool obscure= true;

  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.PostData(url: login, data: {
      'email': email,
      "password": password,

    },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel?.user?.id);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void changeCheckBox(checked) {
    isChecked = checked;
    emit(ChangeRememberState());
  }

  void changeIcon() {
    obscure =! obscure;
    print(obscure);
    emit(ChangeIconState());
  }

}
