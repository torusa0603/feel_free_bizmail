import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // build メソッド内でフックを使用できます。
    var stateRes = useState("");
    var statePrompt = useState("");
    var numberTagText = useState(1);
    const borderSide = BorderSide(
      color: Colors.black,
      width: 1,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                border: Border(
                  left: borderSide,
                  top: borderSide,
                  right: borderSide,
                  bottom: borderSide,
                ),
              ),
              child: SingleChildScrollView(
                  child: _TagText(
                number: numberTagText.value,
              )),
            ),
            TextButton(
              onPressed: () {
                numberTagText.value++;
              },
              child: const Text('+'),
            ),
            TextButton(
              onPressed: () async {
                final model = GenerativeModel(
                    model: 'gemini-pro',
                    apiKey: 'AIzaSyAf1W8FBIEIL_VT2VJrWyqdB8l7WCYSRL4');
                statePrompt.value = 'なにか喋って';
                final response = await model
                    .generateContent([Content.text(statePrompt.value)]);
                stateRes.value = response.text ?? "";
              },
              child: const Text('Generate'),
            ),
            Text(stateRes.value),
          ],
        ),
      ),
    );
  }
}

class _TagText extends StatelessWidget {
  const _TagText({required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int i = 0; i < number; i++) ...{const TextField()}
      ],
    );
  }
}
