import 'dart:convert';
import 'dart:developer';
<<<<<<< HEAD
import 'dart:io';
=======
import 'dart:html';
import 'dart:io';
import 'package:flutter_application_1/models/comment.dart';
>>>>>>> vini
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/services/post_service.dart';

class PostController {
  Future<List<Post>> fetchAll() async {
    return await PostServices().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
<<<<<<< HEAD
        var jsonBody = jsonDecode(res.body);
        return List.generate(
          jsonBody.length,
          (index) => Post.fromMap(
            jsonBody[index],
=======
        var jsonData = jsonDecode(res.body);
        return List.generate(
          jsonData.length,
          (index) => Post.fromMap(
            jsonData[index],
>>>>>>> vini
          ),
        );
      } else {
        throw Exception();
      }
    });
  }

<<<<<<< HEAD
=======
  Future<List<comment>> fetchcomments(int id)async{
    return await PostServices().fetchComments(id).then((rest){
    if (rest.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(rest.body);
        return List.generate(jsonData.length, 
        (index) => comment.fromMap(jsonData[index]),
        );
      } else{
        throw Exception();
      }
    });
  }

>>>>>>> vini
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
