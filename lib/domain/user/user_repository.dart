import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:feel_free_bizmail/domain/user/entity/user.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  // 未実装エラーを返却するようにしておく
  throw UnimplementedError();
}

/// User テーブル 及び 認証 に関するリポジトリ
abstract interface class UserRepository {
  /// サインアップ
  Future<String> signUp({
    required String email,
    required String password,
  });

  /// サインイン
  Future<User> signIn({
    required String email,
    required String password,
  });

  /// User テーブルへユーザーレコードを追加 または 更新
  Future<User> register({required User user});

  /// User テーブル内のユーザーレコードを削除
  Future<void> delete({required String uid});

  /// User テーブル内のユーザーレコードを取得
  Future<User> fetch({required String uid});
}
