import 'dart:convert';

import 'package:RMFlutter/app/locator.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  final client = http.Client();

  Future<User> getUserProfile(int userId) async {
    final response = await client.get('$endpoint/users/$userId');
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    final response = await client.get('$endpoint/posts?userId=$userId');
    return (json.decode(response.body) as List<dynamic>)
        .map((post) => Post.fromJson(post))
        .toList();
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    final response = await client.get('$endpoint/comments?postId=$postId');
    return (json.decode(response.body) as List<dynamic>)
        .map((comment) => Comment.fromJson(comment))
        .toList();
  }
}
