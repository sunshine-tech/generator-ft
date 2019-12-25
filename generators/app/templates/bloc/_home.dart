import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '<%= name %>_bloc.dart';
import '<%= name %>_event.dart';
import '<%= name %>_state.dart';
import 'widgets/<%= name %>_bottom_loader_widget.dart';
import 'widgets/<%= name %>_entry_widget.dart';

class <%= Name %>Home extends StatefulWidget {
  <%= Name %>Home();

  State<<%= Name %>Home> createState() => _<%= Name %>HomeState();
}

class _<%= Name %>HomeState extends State<<%= Name %>Home> {
  <%= Name %>Bloc _<%= name %>Bloc;

  @override
  void initState() {
    super.initState();
    _<%= name %>Bloc = BlocProvider.of<<%= Name %>Bloc>(context);
    _<%= name %>Bloc.add(<%= Name %>EventFetch());
  }

  List<Widget> _renderHeader(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        expandedHeight: 120.0,
        floating: true,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("<%= Name %>",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                )),
            background: Image.network(
              "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
              fit: BoxFit.cover,
            )),
      ),
    ];
  }

  Widget _renderBody(BuildContext context, <%= Name %>State state) {
    return NestedScrollView(
      headerSliverBuilder: _renderHeader,
      body: _renderList(context, state),
    );
  }

  Widget _renderListItemLabel({String text}) {
    Widget childItem = CircularProgressIndicator();

    if (text != null) {
      childItem = Center(
        child: Text(text),
      );
    }
    return ListView(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          childItem,
        ],
      ),
    ]);
  }

  Widget _renderList(BuildContext context, <%= Name %>State state) {
    if (state is <%= Name %>Uninitialized || state is <%= Name %>Loading) {
      return _renderListItemLabel();
    }

    if (state is <%= Name %>Error) {
      return _renderListItemLabel(text: 'failed to fetch posts');
    }

    if (state is <%= Name %>Loaded) {
      if (state.<%= name %>s.isEmpty) {
        return _renderListItemLabel(text: 'no posts');
      }

      var itemLen = state.<%= name %>s.length;
      var buildLen = itemLen + 1;

      if (state.isReachedMax()) {
        buildLen = itemLen;
      }

      return ListView.builder(
        padding: kMaterialListPadding,
        itemCount: buildLen,
//        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (index >= state.<%= name %>s.length && !state.isReachedMax()) {
            _<%= name %>Bloc.add(<%= Name %>EventFetch());
            return <%= Name %>BottomLoader();
          }
          return <%= Name %>EntryWidget(<%= name %>: state.<%= name %>s[index]);
        },
      );
    }
    return _renderListItemLabel(text: 'Unknow error');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<<%= Name %>Bloc, <%= Name %>State>(
      listener: (context, state) {
        if (state is <%= Name %>Loaded) {}
        if (state is <%= Name %>Loading) {}
      },
      child: BlocBuilder<<%= Name %>Bloc, <%= Name %>State>(
        builder: _renderBody,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


