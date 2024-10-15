import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:feel_free_bizmail/format/format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:feel_free_bizmail/common/color_stule.dart';

class AcountPage extends HookConsumerWidget {
  const AcountPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stateEmail = useState("");
    var statePassword = useState("");
    var stateInfomag = useState("");

    return Scaffold(
      backgroundColor: blueTheme.colorScheme.surface,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // メールアドレス入力
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'メールアドレス',
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: blueTheme.primaryColor,
                      ),
                    ),
                  ),
                  onChanged: (String value) {
                    stateEmail.value = value;
                  }),
              // パスワード入力
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'パスワード',
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: blueTheme.primaryColor,
                    ),
                  ),
                ),
                obscureText: true,
                onChanged: (String value) {
                  statePassword.value = value;
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                // メッセージ表示
                child: Text(stateInfomag.value),
              ),
              SizedBox(
                width: double.infinity,
                // ユーザー登録ボタン
                child: ElevatedButton(
                  child: const Text('ユーザー登録'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでユーザー登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.createUserWithEmailAndPassword(
                        email: stateEmail.value,
                        password: statePassword.value,
                      );
                      // ユーザー登録に成功した場合
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormatPage(
                              title: 'Feel free Bizmail',
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      // ユーザー登録に失敗した場合
                      stateInfomag.value = "登録に失敗しました。";
                      debugPrint(e.toString());
                    }
                  },
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                // ログイン登録ボタン
                child: OutlinedButton(
                  child: const Text('ログイン'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでログイン
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.signInWithEmailAndPassword(
                        email: stateEmail.value,
                        password: statePassword.value,
                      );
                      // ログインに成功した場合
                      // チャット画面に遷移＋ログイン画面を破棄
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormatPage(
                              title: 'Feel free Bizmail',
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      stateInfomag.value = "ログインに失敗しました。";
                      debugPrint(e.toString());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}