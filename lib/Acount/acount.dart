import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:feel_free_bizmail/format/format.dart';

class AcountPage extends HookConsumerWidget {
  const AcountPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("次の画面へ"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormatPage(
                  title: 'Feel free Bizmail',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
