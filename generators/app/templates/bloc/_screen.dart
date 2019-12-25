import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '<%= name %>_bloc.dart';
import '<%= name %>_repository.dart';
import '<%= name %>_home.dart';

class <%= Name %>Screen extends StatefulWidget {
  <%= Name %>Screen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _<%= Name %>Screen createState() => _<%= Name %>Screen();
}

class _<%= Name %>Screen extends State<<%= Name %>Screen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<<%= Name %>Bloc>(
      create: (context) => <%= Name %>Bloc(<%= name %>Repository: <%= Name %>Selector.getClass()),
      child: <%= Name %>Home(),
    );

  }
}
