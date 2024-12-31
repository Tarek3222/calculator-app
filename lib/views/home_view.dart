import 'package:calculator_app/core/constants/styles.dart';
import 'package:calculator_app/views/widgets/change_theme_widget.dart';
import 'package:calculator_app/views/widgets/custom_background_container.dart';
import 'package:calculator_app/views/widgets/custom_button.dart';
import 'package:calculator_app/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            ChangeThemeWidget(),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '20+40',
                        style: Styles.font50Regular(context),
                      ),
                      Text(
                        '60',
                        style: Styles.font50Regular(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomBackgroundContainer(
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        icon: Icons.history,
                        color: Colors.grey,
                        tooltip: 'History',
                        size: 30,
                        onPressed: () {},
                      ),
                      CustomIconButton(
                        icon: Icons.backspace_outlined,
                        tooltip: 'Backspace',
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: 'AC',
                        onPressed: () {},
                        color: Colors.red,
                      ),
                      CustomButton(
                        text: '( )',
                        onPressed: () {},
                        color: Colors.green,
                      ),
                      CustomButton(
                        text: '%',
                        onPressed: () {},
                        color: Colors.green,
                      ),
                      CustomButton(
                        text: '/',
                        onPressed: () {},
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: '7',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '8',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '9',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: 'x',
                        onPressed: () {},
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: '4',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '5',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '6',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '-',
                        onPressed: () {},
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: '1',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '2',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '3',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '+',
                        onPressed: () {},
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: '0',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '.',
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      SizedBox(
                        width: 140,
                        child: CustomButton(
                          text: '=',
                          onPressed: () {},
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
