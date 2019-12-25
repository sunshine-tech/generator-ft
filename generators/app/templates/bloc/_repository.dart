import '<%= name %>_repository_mock.dart';
import '<%= name %>_model.dart';

abstract class <%= Name %>Repository {

  Future<List<<%= Name %>>> fetch<%= Name %>(int startIndex, int limit);
  Future<Stream<dynamic>> listen<%= Name %>();
}

class <%= Name %>Selector {
  static getClass() {
    return <%= Name %>RepositoryMock();
  }
}
