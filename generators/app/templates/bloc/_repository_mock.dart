import 'dart:convert';

import 'package:http/http.dart' as http;

import '<%= name %>_model.dart';
import '<%= name %>_repository.dart';

class <%= Name %>RepositoryMock implements <%= Name %>Repository {
  final http.Client httpClient = http.Client();

  @override
  Future<List<<%= Name %>>> fetch<%= Name %>(int startIndex, int limit) async {
    final url =
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit';

    final response =
        await httpClient.get(url).timeout(Duration(milliseconds: 5000));

    if (response.statusCode != 200) {
      throw Exception('Error fetching data');
    }
    final data = json.decode(response.body) as List;
    await Future.delayed(Duration(microseconds: 500));
    return data
        .map((rawPost) => <%= Name %>(
            id: rawPost['id'].toString(),
            title: rawPost['title'],
            body: rawPost['body']))
        .toList();
  }
}
