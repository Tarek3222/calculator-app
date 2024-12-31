import 'package:calculator_app/bussnies_logic/change_theme_cubit.dart/change_theme_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitialState());
  bool isDarkMode = false;

  late SharedPreferences storage;
  void changeTheme() {
    isDarkMode = !isDarkMode;
    storage.setBool('isDarkMode', isDarkMode);
    emit(ChangeThemeSuccessState());
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    isDarkMode = storage.getBool('isDarkMode') ?? false;
    emit(ChangeThemeSuccessState());
  }
}
