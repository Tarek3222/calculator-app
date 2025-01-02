import 'package:calculator_app/core/constants/styles.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView(
      {super.key, required this.equations, required this.results});
  final List<String> equations;
  final List<String> results;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: equations.isEmpty
          ? const Center(child: Text('No History'))
          : ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    equations[index],
                    style: Styles.font24SemiBold(context),
                  ),
                  subtitle: Text(
                    '= ${results[index]}',
                    style: Styles.font24SemiBold(context).copyWith(
                      color: Colors.green,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: equations.length,
            ),
    );
  }
}
