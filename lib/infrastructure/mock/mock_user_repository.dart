import 'dart:async';

import 'package:feel_free_bizmail/domain/user/entity/user.dart';
import 'package:feel_free_bizmail/domain/user/user_repository.dart';
import 'package:feel_free_bizmail/domain/app_exception.dart';

class MockUserRepository implements UserRepository {
  final mockUserId = 'mockuser000';
  final mockUserName = 'Mock User';

  @override
  Future<User> signIn({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email != 'test@example.com' || password != 'test') {
      throw const AppException('メールアドレス または パスワードが異なります');
    }
    return User(
      id: mockUserId,
      userName: mockUserName,
    );
  }

  @override
  Future<String> signUp(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    if (!email.contains('@')) {
      throw const AppException('メールアドレスの形式が不正です');
    }
    return mockUserId;
  }

  @override
  Future<User> register({required User user}) async {
    await Future.delayed(const Duration(seconds: 2));
    return User(
      id: user.id,
      userName: user.userName,
    );
  }

  @override
  Future<void> delete({required String uid}) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<User> fetch({required String uid}) async {
    await Future.delayed(const Duration(seconds: 2));
    return User(
      id: uid,
      userName: '${mockUserName}2',
    );
  }
}
