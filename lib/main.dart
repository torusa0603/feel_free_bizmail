import 'dart:io';

import 'package:feel_free_bizmail/domain/user/user_repository.dart';
import 'package:feel_free_bizmail/infrastructure/mock/mock_user_repository.dart';
import 'package:feel_free_bizmail/infrastructure/remote/remote_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:feel_free_bizmail/presentation/page/sign_in.dart';

//使用Widgetの先祖にProviderScopeを配置する
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  UserRepository userRepository;
  if (Platform.isAndroid) {
    userRepository = await RemoteUserRepository.create();
  } else {
    userRepository = MockUserRepository(); // テスト用のリポジトリ
  }

  runApp(
    ProviderScope(overrides: [
      userRepositoryProvider.overrideWithValue(userRepository),
    ], child: const MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Feel free Bizmail',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInPage(title: 'Feel free Bizmail'),
    );
  }
}
