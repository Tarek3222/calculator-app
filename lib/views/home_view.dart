import 'dart:developer';

import 'package:calculator_app/core/constants/styles.dart';
import 'package:calculator_app/core/utils/custom_snack_bar.dart';
import 'package:calculator_app/views/widgets/change_theme_widget.dart';
import 'package:calculator_app/views/widgets/custom_background_container.dart';
import 'package:calculator_app/views/widgets/custom_button.dart';
import 'package:calculator_app/views/widgets/custom_icon_button.dart';
import 'package:calculator_app/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String result = '';
  TextEditingController controller = TextEditingController();
  List<String> operators = ['+', '-', 'x', '%', '÷'];
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
                  padding: const EdgeInsets.only(right: 16, left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextField(controller: controller),
                      Text(
                        result,
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
                        color:
                            controller.text.isEmpty ? Colors.grey : Colors.red,
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            setState(() {
                              controller.text = controller.text
                                  .substring(0, controller.text.length - 1);
                            });
                          }
                        },
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
                        onPressed: () {
                          if (result.isNotEmpty || controller.text.isNotEmpty) {
                            setState(() {
                              result = '';
                              controller.text = '';
                            });
                          }
                        },
                        color: Colors.red,
                      ),
                      CustomButton(
                        text: '+/-',
                        onPressed: () {
                          if (controller.text.isEmpty ||
                              controller.text == '-') {
                            setState(() {
                              controller.text = controller.text.startsWith('-')
                                  ? controller.text.substring(1)
                                  : '-${controller.text}';
                            });
                            return;
                          }
                          if (controller.text.isNotEmpty &&
                              !operators.contains(controller
                                  .text[controller.text.length - 1])) {
                            setState(() {
                              controller.text = controller.text.startsWith('-')
                                  ? controller.text.substring(1)
                                  : '-${controller.text}';
                            });
                            return;
                          }
                        },
                        color: Colors.green,
                      ),
                      CustomButton(
                        text: '%',
                        onPressed: () {
                          if (controller.text.isNotEmpty &&
                              !operators.contains(controller
                                  .text[controller.text.length - 1])) {
                            setState(() {
                              controller.text += '%';
                            });
                          }
                        },
                        color: Colors.green,
                      ),
                      CustomButton(
                        text: '÷',
                        onPressed: () {
                          if (controller.text.isNotEmpty &&
                              !operators.contains(controller
                                  .text[controller.text.length - 1])) {
                            setState(() {
                              controller.text += '÷';
                            });
                          }
                        },
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: '7',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          if (controller.text.isNotEmpty &&
                              controller.text[0] == '0') {
                            setState(() {
                              controller.text = '7';
                            });
                          } else if (controller.text.isNotEmpty &&
                              numbers[numbers.length - 1] == '0') {
                            controller.text = controller.text
                                .substring(0, controller.text.length - 1);
                            controller.text += '7';
                            setState(() {});
                          } else {
                            setState(() {
                              controller.text += '7';
                            });
                          }
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '8',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          if (controller.text.isNotEmpty &&
                              controller.text[0] == '0') {
                            setState(() {
                              controller.text = '8';
                            });
                          } else if (controller.text.isNotEmpty &&
                              numbers[numbers.length - 1] == '0') {
                            controller.text = controller.text
                                .substring(0, controller.text.length - 1);
                            controller.text += '8';
                            setState(() {});
                          } else {
                            setState(() {
                              controller.text += '8';
                            });
                          }
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '9',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          if (controller.text.isNotEmpty &&
                              controller.text[0] == '0') {
                            setState(() {
                              controller.text = '9';
                            });
                          } else if (controller.text.isNotEmpty &&
                              numbers[numbers.length - 1] == '0') {
                            controller.text = controller.text
                                .substring(0, controller.text.length - 1);
                            controller.text += '9';
                            setState(() {});
                          } else {
                            setState(() {
                              controller.text += '9';
                            });
                          }
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: 'x',
                        onPressed: () {
                          if (controller.text.isNotEmpty &&
                              !operators.contains(controller
                                  .text[controller.text.length - 1])) {
                            setState(() {
                              controller.text += 'x';
                            });
                          }
                        },
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: '4',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          if (controller.text.isNotEmpty &&
                              controller.text[0] == '0') {
                            setState(() {
                              controller.text = '4';
                            });
                          } else if (controller.text.isNotEmpty &&
                              numbers[numbers.length - 1] == '0') {
                            controller.text = controller.text
                                .substring(0, controller.text.length - 1);
                            controller.text += '4';
                            setState(() {});
                          } else {
                            setState(() {
                              controller.text += '4';
                            });
                          }
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '5',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          if (controller.text.isNotEmpty &&
                              controller.text[0] == '0') {
                            setState(() {
                              controller.text = '5';
                            });
                          } else if (controller.text.isNotEmpty &&
                              numbers[numbers.length - 1] == '0') {
                            controller.text = controller.text
                                .substring(0, controller.text.length - 1);
                            controller.text += '5';
                            setState(() {});
                          } else {
                            setState(() {
                              controller.text += '5';
                            });
                          }
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '6',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          if (controller.text.isNotEmpty &&
                              controller.text[0] == '0') {
                            setState(() {
                              controller.text = '6';
                            });
                          } else if (controller.text.isNotEmpty &&
                              numbers[numbers.length - 1] == '0') {
                            controller.text = controller.text
                                .substring(0, controller.text.length - 1);
                            controller.text += '6';
                            setState(() {});
                          } else {
                            setState(() {
                              controller.text += '6';
                            });
                          }
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '-',
                        onPressed: () {
                          if (controller.text.isNotEmpty &&
                              !operators.contains(controller
                                  .text[controller.text.length - 1])) {
                            setState(() {
                              controller.text += '-';
                            });
                          }
                        },
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: '1',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          if (controller.text.isNotEmpty &&
                              controller.text[0] == '0') {
                            setState(() {
                              controller.text = '1';
                            });
                          } else if (controller.text.isNotEmpty &&
                              numbers[numbers.length - 1] == '0') {
                            controller.text = controller.text
                                .substring(0, controller.text.length - 1);
                            controller.text += '1';
                            setState(() {});
                          } else {
                            setState(() {
                              controller.text += '1';
                            });
                          }
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '2',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          if (controller.text.isNotEmpty &&
                              controller.text[0] == '0') {
                            setState(() {
                              controller.text = '2';
                            });
                          } else if (controller.text.isNotEmpty &&
                              numbers[numbers.length - 1] == '0') {
                            controller.text = controller.text
                                .substring(0, controller.text.length - 1);
                            controller.text += '2';
                            setState(() {});
                          } else {
                            setState(() {
                              controller.text += '2';
                            });
                          }
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '3',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          if (controller.text.isNotEmpty &&
                              controller.text[0] == '0') {
                            setState(() {
                              controller.text = '3';
                            });
                          } else if (controller.text.isNotEmpty &&
                              numbers[numbers.length - 1] == '0') {
                            controller.text = controller.text
                                .substring(0, controller.text.length - 1);
                            controller.text += '3';
                            setState(() {});
                          } else {
                            setState(() {
                              controller.text += '3';
                            });
                          }
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '+',
                        onPressed: () {
                          if (controller.text.isNotEmpty &&
                              !operators.contains(controller
                                  .text[controller.text.length - 1])) {
                            setState(() {
                              controller.text += '+';
                            });
                          }
                        },
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: '0',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          if (controller.text.isNotEmpty &&
                              controller.text[controller.text.length - 1] ==
                                  '÷') {
                            customSnackBar(
                                'Cannot divide by zero', context, Colors.red);
                            return;
                          }
                          if (controller.text.isNotEmpty &&
                              (controller.text[0] == '0' ||
                                  numbers[numbers.length - 1] == '0')) {
                            return;
                          }
                          setState(() {
                            controller.text += '0';
                          });
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomButton(
                        text: '.',
                        onPressed: () {
                          List<String> numbers = controller.text.split(RegExp(
                            r'(\+|\-|\*|\÷|\%|)',
                          ));
                          log(numbers.toString());
                          if (numbers[numbers.length - 1].contains('.')) {
                            return;
                          }
                          if (controller.text.isEmpty) {
                            setState(() {
                              controller.text += '0.';
                            });
                          } else if (operators.contains(
                              controller.text[controller.text.length - 1])) {
                            setState(() {
                              controller.text += '0.';
                            });
                          } else {
                            setState(() {
                              controller.text += '.';
                            });
                          }
                        },
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
