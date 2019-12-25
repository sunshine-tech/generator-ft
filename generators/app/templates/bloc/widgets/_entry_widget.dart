import 'package:flutter/material.dart';
import '../<%= name %>_model.dart';

class <%= Name %>EntryWidget extends StatelessWidget {
  final <%= Name %> <%= name %>;

  const <%= Name %>EntryWidget({Key key, @required this.<%= name %>}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${<%= name %>.id}',
        style: TextStyle(fontSize: 16.0),
      ),
      title: Text(<%= name %>.title),
      subtitle: Text(<%= name %>.body),
    );
  }
}
