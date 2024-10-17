import 'package:feel_free_bizmail/domain/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:feel_free_bizmail/presentation/page/create_mail_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key, required this.title});
  final String title;

  final keyMail = "mail";
  final keyPassword = "password";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stateEmail = useState("");
    var statePassword = useState("");
    var stateInfomag = useState("");
    final userRepository = ref.watch(userRepositoryProvider);

    // prefsを状態として管理
    var prefsState = useState<SharedPreferences?>(null);

    // 初期処理: useEffectを使って初回描画時に一度だけ処理を行う
    useEffect(() {
      Future<void> fetchData() async {
        // 初期処理 (例えば、プロバイダーの監視やデータ取得)
        final prefs = await SharedPreferences.getInstance();
        prefsState.value = prefs;
        stateEmail.value = prefsState.value!.getString(keyMail) ?? "";
        debugPrint(stateEmail.value);
        statePassword.value = prefsState.value!.getString(keyPassword) ?? "";
        debugPrint(statePassword.value);
      }

      fetchData();

      // クリーンアップ処理（必要ならここでリソースを解放）
      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // メールアドレス入力
              TextFormField(
                  decoration: const InputDecoration(labelText: 'メールアドレス'),
                  controller: TextEditingController(text: stateEmail.value),
                  onChanged: (String value) {
                    stateEmail.value = value;
                  }),
              // パスワード入力
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                controller: TextEditingController(text: statePassword.value),
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
                // ログイン登録ボタン
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.green),
                  ),
                  onPressed: () async {
                    try {
                      await userRepository.signIn(
                        email: stateEmail.value,
                        password: statePassword.value,
                      );
                      // ログインに成功した場合
                      // チャット画面に遷移＋ログイン画面を破棄
                      if (context.mounted) {
                        prefsState.value!.setString(keyMail, stateEmail.value);
                        prefsState.value!
                            .setString(keyPassword, statePassword.value);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateMailContextPage(
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
                  child: const Text('ログイン'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                // ユーザー登録ボタン
                child: ElevatedButton(
                  child: const Text('ユーザー登録'),
                  onPressed: () async {
                    try {
                      await userRepository.signUp(
                        email: stateEmail.value,
                        password: statePassword.value,
                      );
                      // ユーザー登録に成功した場合
                      if (context.mounted) {
                        prefsState.value!.setString(keyMail, stateEmail.value);
                        prefsState.value!
                            .setString(keyPassword, statePassword.value);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateMailContextPage(
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
            ],
          ),
        ),
      ),
    );
  }
}
