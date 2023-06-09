import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/services/post_service.dart';

class PostController {
  Future<List<Post>> fetchAll() async {
    return await PostServices().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonBody = jsonDecode(res.body);
        return List.generate(
          jsonBody.length,
          (index) => Post.fromMap(
            jsonBody[index],
          ),
        );
      } else {
        throw Exception();
      }
    });
  }

  Future<bool> delete(int id) async {
    return await PostServices().delete(id).then((res) {
      inspect(res);
      if (res.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    });
  }
}
