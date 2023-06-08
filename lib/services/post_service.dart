import 'dart:convert';

import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/utils/endpoin.dart';
import 'package:flutter_application_1/utils/request_helper.dart';
import 'package:http/http.dart' as http;

class PostServices {
  Future<http.Response> fetch() async {
    String endPoint = EndPoint.post;
    Uri url = Uri.parse(endPoint);
    return await http.get(url, headers: RequestHelper.basicHeader());
  }

  Future<http.Response> fetchComments(int id) async {
    String endPoint = "${EndPoint.post}/$id/comments";
    Uri url = Uri.parse(endPoint);

    return await http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> create(Post post) async {
    String endPoint = EndPoint.post;
    Uri url = Uri.parse(endPoint);
    var jsonBody = post.toMap();

    return await http.post(
      url,
      body: jsonEncode(jsonBody),
      headers: RequestHelper.basicHeader(),
    );
  }
}
