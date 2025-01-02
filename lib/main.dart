import 'package:calculator_app/bussnies_logic/change_theme_cubit.dart/change_theme_cubit.dart';
import 'package:calculator_app/bussnies_logic/change_theme_cubit.dart/change_theme_states.dart';
import 'package:calculator_app/core/theme/app_theme.dart';
import 'package:calculator_app/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyBySNh0VZ5oNRmQgJJ_y5WH5MkNQnzmlwo');
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit()..init(),
      child: Builder(builder: (context) {
        return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: BlocProvider.of<ChangeThemeCubit>(context).isDarkMode
                  ? AppTheme.darkTheme
                  : AppTheme.lightTheme,
              home: SplashView(),
            );
          },
        );
      }),
    );
  }
}
