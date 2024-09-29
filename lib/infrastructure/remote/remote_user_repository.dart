import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

import 'package:feel_free_bizmail/domain/user/entity/user.dart';
import 'package:feel_free_bizmail/domain/user/user_repository.dart';
import 'package:feel_free_bizmail/domain/app_exception.dart';

class RemoteUserRepository implements UserRepository {
  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      final firebase.FirebaseAuth auth = firebase.FirebaseAuth.instance;
      final ret = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (ret.user == null) {
        throw const AppException("");
      }
      return User(
        id: ret.user!.uid,
        userName: ret.user!.displayName ?? "",
      );
    } catch (e) {
      // ユーザー登録に失敗した場合
      rethrow;
    }
  }

  @override
  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      // メール/パスワードでユーザー登録
      final firebase.FirebaseAuth auth = firebase.FirebaseAuth.instance;
      final ret = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ret.user!.uid;
    } catch (e) {
      // ユーザー登録に失敗した場合
      rethrow;
    }
  }

  @override
  Future<User> register({required User user}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String uid}) async {
    throw UnimplementedError();
  }

  @override
  Future<User> fetch({required String uid}) async {
    throw UnimplementedError();
  }
}
