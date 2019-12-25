import 'package:equatable/equatable.dart';

import '<%= name %>_model.dart';

abstract class <%= Name %>Event extends Equatable {
  const <%= Name %>Event();

  @override
  List<Object> get props => [];
}

class <%= Name %>EventFetch extends <%= Name %>Event {
  final bool reload;
  <%= Name %>EventFetch({this.reload});
  @override
  String toString() => 'Fetch';
}

class <%= Name %>EventUpdate extends <%= Name %>Event {
  final List<<%= Name %>> <%= name %>s;

  <%= Name %>EventUpdate({this.<%= name %>s});

  @override
  List<Object> get props => [<%= name %>s];

  @override
  String toString() => '<%= Name %>EventUpdate $<%= name %>s';
}
