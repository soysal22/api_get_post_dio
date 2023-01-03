// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_api/post_model.dart';

class PostInsert extends StatefulWidget {
  const PostInsert({super.key});

  @override
  State<PostInsert> createState() => _PostInsertState();
}

class _PostInsertState extends State<PostInsert> {
  final TextEditingController _textTitleController = TextEditingController();
  final TextEditingController _textBodyController = TextEditingController();
  final TextEditingController _textIdController = TextEditingController();

  late final Dio _dio;

  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _isLoadingCheck() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> insertApi(PostModel model) async {
    _isLoadingCheck();
    final response = await _dio.post('posts', data: model);

    if (response.statusCode == HttpStatus.created) {
      print('Başarılı');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _textTitleController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            keyboardType: TextInputType.text,
            maxLength: 20,
          ),
          TextField(
            controller: _textBodyController,
            decoration: const InputDecoration(
              labelText: 'Surname',
            ),
            keyboardType: TextInputType.text,
            maxLength: 20,
          ),
          TextField(
            controller: _textIdController,
            decoration: const InputDecoration(
              labelText: 'User id',
            ),
            keyboardType: TextInputType.number,
            maxLength: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_textTitleController.text.isNotEmpty &&
                          _textBodyController.text.isNotEmpty &&
                          _textIdController.text.isNotEmpty) {
                        final model = PostModel(
                            title: _textTitleController.text,
                            body: _textBodyController.text,
                            userId: int.tryParse(_textIdController.text));
                        insertApi(model);
                      }
                    },
              icon: const Icon(Icons.save),
              label: const Text('Save'))
        ],
      ),
    );
  }
}
