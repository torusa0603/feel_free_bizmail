import 'package:flutter/material.dart';

final ThemeData blueTheme = ThemeData(
  // 基本のテーマカラーを設定
  colorScheme: ColorScheme(
    primary: Colors.blue, // メインの青
    primaryContainer: Colors.blue[700]!, // 濃い青
    secondary: Colors.lightBlueAccent, // アクセントカラー（淡い青）
    secondaryContainer: Colors.lightBlue[700]!, // 背景色（淡い青）
    surface: Colors.white, // サーフェス（カードやボタンの背景）
    onPrimary: Colors.white, // メイン青背景上のテキストやアイコン
    onSecondary: Colors.white, // 背景上のテキスト
    onSurface: Colors.black, // サーフェス上のテキスト
    error: Colors.red, // エラーカラー
    onError: Colors.white, // エラー上のテキスト
    brightness: Brightness.light, // 明るいテーマに設定
  ),
  // テキストテーマやその他スタイルも指定可能
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Colors.blue),
    bodyLarge: TextStyle(color: Colors.black),
  ),
);
