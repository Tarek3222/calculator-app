import 'package:calculator_app/bussnies_logic/change_theme_cubit.dart/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.light_mode,
          color: Theme.of(context).colorScheme.onPrimaryFixed,
        ),
        Switch(
          value: BlocProvider.of<ChangeThemeCubit>(context).isDarkMode,
          activeColor: Colors.orange,
          onChanged: (value) {
            BlocProvider.of<ChangeThemeCubit>(context).changeTheme();
          },
        ),
        Icon(
          Icons.dark_mode,
          color: Theme.of(context).colorScheme.outline,
        ),
      ],
    );
  }
}
