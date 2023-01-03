// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_api/post_model.dart';

// ignore: must_be_immutable
class PostGet {
  var _itemsListe;

  Future postGet() async {
    final connection =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');

    final veri = connection.statusCode;

    if (veri == HttpStatus.ok) {
      var datas = connection.data;
      if (datas is List) {
        _itemsListe = datas.map((e) => PostModel.fromJson(e)).toList();
        return _itemsListe;
      }
    }
  }
}
