import 'package:calculator_app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryView extends StatefulWidget {
  const HistoryView(
      {super.key, required this.equations, required this.results});
  final List<String> equations;
  final List<String> results;

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: widget.equations.isEmpty
          ? const Center(child: Text('No History'))
          : Stack(
              children: [
                ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        widget.equations[index],
                        style: Styles.font24SemiBold(context),
                      ),
                      subtitle: Text(
                        '= ${widget.results[index]}',
                        style: Styles.font24SemiBold(context).copyWith(
                          color: Colors.green,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: widget.equations.length,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        SharedPreferences.getInstance().then(
                          (prefs) {
                            prefs.remove('historyEquations');
                            prefs.remove('historyResults');
                            widget.equations.clear();
                            widget.results.clear();
                            setState(() {});
                          },
                        );
                      },
                      child: const Text('Clear History'),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
