import 'package:equatable/equatable.dart';

class <%= Name %> extends Equatable {
  final String id;
  final String title;
  final String body;

  <%= Name %>({this.id, this.title, this.body});

  @override
  List<Object> get props => [id, title, body];

   <%= Name %>.fromMap(Map snapshot, String id) :
        id = id ?? '',
        title = snapshot['title'] ?? '',
        body = snapshot['content'] ?? '';

  @override
  String toString() => '<%= Name %> { id: $id, title: $title, content: $body}';
}
