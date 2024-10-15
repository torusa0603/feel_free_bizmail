import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FilePickerScreen(),
    );
  }
}

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilePickerScreenState createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  File? _selectedImage;
  String _filePath = '';

  Future<void> _pickFile() async {
    // ファイル選択ダイアログを表示して画像ファイルを選択
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // 画像ファイルのみ
    );

    if (result != null) {
      setState(() {
        // ファイルパスを取得
        _filePath = result.files.single.path ?? '';
        // 画像ファイルを読み込み
        _selectedImage = File(_filePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Picker Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickFile,
              child: const Text('画像を選択'),
            ),
            const SizedBox(height: 20),
            // ファイルパスの表示
            Text(
                _filePath.isNotEmpty ? 'ファイルパス: $_filePath' : 'ファイルが選択されていません'),
            const SizedBox(height: 20),
            // 選択された画像を表示
            _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                : const Text('画像が選択されていません'),
          ],
        ),
      ),
    );
  }
}
