import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateMailContextPage extends HookConsumerWidget {
  const CreateMailContextPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // build メソッド内でフックを使用できます。
    var statePreMailContext = useState("");
    var stateRes = useState("");
    var statePrompt = useState("");
    var numberTagText = useState(1);
    var nakami = useState<List<TextEditingController>>([]);
    const borderSide = BorderSide(
      color: Colors.black,
      width: 1,
    );
    nakami.value.add(TextEditingController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: SingleChildScrollView(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: '前回メール内容'),
                      obscureText: true,
                      controller: TextEditingController(
                          text: statePreMailContext.value),
                      onChanged: (String value) {
                        statePreMailContext.value = value;
                      },
                    ),
                  ),
                ),
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
                    nakami: nakami.value,
                  )),
                ),
                TextButton(
                  onPressed: () {
                    numberTagText.value++;
                    nakami.value.add(TextEditingController());
                  },
                  child: const Text('+'),
                ),
                TextButton(
                  onPressed: () async {
                    final model = GenerativeModel(
                        model: 'gemini-pro',
                        apiKey: 'AIzaSyAf1W8FBIEIL_VT2VJrWyqdB8l7WCYSRL4');
                    statePrompt.value +=
                        "次のシチュエーションに合いそうなビジネスメールのフォーマットを作成して下さい。{";
                    for (int i = 0; i < numberTagText.value; i++) {
                      statePrompt.value += nakami.value[i].text;
                      statePrompt.value += ",";
                    }
                    statePrompt.value += "}";
                    statePrompt.value += "以前のメール内容も参考して下さい。";
                    statePrompt.value += "以前のメール内容:";
                    statePrompt.value += statePreMailContext.value;
                    final response = await model
                        .generateContent([Content.text(statePrompt.value)]);
                    stateRes.value =
                        // "質問文 : ${statePrompt.value}\n\n"
                        response.text ?? "";
                    statePrompt.value = "";
                  },
                  child: const Text('Generate'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      stateRes.value,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TagText extends StatelessWidget {
  const _TagText({required this.number, required this.nakami});
  final int number;
  final List<TextEditingController> nakami;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int i = 0; i < number; i++) ...{
          TextField(
            controller: nakami[i],
          )
        }
      ],
    );
  }
}
