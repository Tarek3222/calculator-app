// ignore_for_file: use_build_context_synchronously

import 'package:calculator_app/core/constants/styles.dart';
import 'package:calculator_app/core/utils/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:whiteboard/whiteboard.dart';

class WhiteBoardView extends StatefulWidget {
  const WhiteBoardView({super.key});

  @override
  State<WhiteBoardView> createState() => _WhiteBoardViewState();
}

class _WhiteBoardViewState extends State<WhiteBoardView> {
  late WhiteBoardController controller;
  String result = '';

  @override
  void initState() {
    controller = WhiteBoardController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whiteboard'),
      ),
      body: Stack(
        children: [
          WhiteBoard(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            controller: controller,
            strokeWidth: 5,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: controller.undo,
                      tooltip: 'Undo',
                      iconSize: 28,
                      icon: const Icon(Icons.undo),
                    ),
                    IconButton(
                      onPressed: controller.redo,
                      iconSize: 28,
                      tooltip: 'Redo',
                      icon: const Icon(Icons.redo),
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      color: Colors.red,
                      tooltip: 'Clear',
                      iconSize: 28,
                      onPressed: () {
                        setState(() {
                          controller.clear();
                          result = '';
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.question_answer),
                      color: Colors.blue,
                      tooltip: 'Answer',
                      iconSize: 28,
                      onPressed: () async {
                        final gemini = Gemini.instance;
                        // take image from whiteboard and send it to gemini
                        gemini.prompt(
                          parts: [
                            Part.text('Can you solve this equation?'),
                            Part.uint8List(await controller.convertToImage())
                          ],
                        ).then(
                          (value) {
                            setState(() {
                              result = value?.output ?? '';
                            });
                          },
                        ).catchError((error) {
                          customSnackBar('invalid input', context, Colors.red);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 16,
            child: result.isEmpty
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Answer:',
                        style: Styles.font24SemiBold(context).copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      Text(
                        result.split('=').last.trim().split('\n').first.trim(),
                        style: Styles.font24SemiBold(context).copyWith(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
