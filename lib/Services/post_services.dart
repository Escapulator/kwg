import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kwgg/Core/api_endpoint.dart';
import 'package:kwgg/Core/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:kwgg/Models/post_view_model.dart';

class PostServices with ChangeNotifier {
  final posts = <PostViewModel>[];

  Future<APIResponse<List<PostViewModel>>?> getPost() async {
    return http.get(Uri.parse(ApiEndpoint.url)).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        // final jsonData = rawData['data'];
        for (var item in jsonData) {
          posts.add(PostViewModel.fromJson(item));
        }
        return APIResponse<List<PostViewModel>>(data: posts);
      }
      return APIResponse<List<PostViewModel>>(
          error: true, errorMessage: data.body);
    }).catchError((e) {
      APIResponse<List<PostViewModel>>(
          error: true, errorMessage: 'An error Occured');
    });
  }
}
