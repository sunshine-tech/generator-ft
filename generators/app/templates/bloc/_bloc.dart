import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '<%= name %>_repository.dart';
import '<%= name %>_model.dart';
import '<%= name %>_event.dart';
import '<%= name %>_state.dart';

class <%= Name %>Bloc extends Bloc<<%= Name %>Event, <%= Name %>State> {
  final <%= Name %>Repository _<%= name %>Repository;

  <%= Name %>Bloc({@required <%= Name %>Repository <%= name %>Repository})
      : this._<%= name %>Repository = <%= name %>Repository;

  @override
  <%= Name %>State get initialState => <%= Name %>Uninitialized();

  @override
  Stream<<%= Name %>State> mapEventToState(<%= Name %>Event event) async* {

    if (event is <%= Name %>EventFetch) {
      try {
        int firstIndex = 0;
        var last<%= Name %>s;
        var <%= name %>Loaded;

        final reload = event.reload ?? false;

        if (state is <%= Name %>Loaded) {
          <%= name %>Loaded = state as <%= Name %>Loaded;
          last<%= Name %>s = <%= name %>Loaded.<%= name %>s;
          firstIndex = last<%= Name %>s.length;
        }

        if (state is <%= Name %>Uninitialized && !_hasReachedMax()) {
          firstIndex = 0;
        }


        final <%= name %>s = await _<%= name %>Repository.fetch<%= Name %>(firstIndex, 10);
        var new<%= Name %>s = <%= name %>s;

        if (!reload && last<%= Name %>s != null) {
          new<%= Name %>s = last<%= Name %>s + <%= name %>s;
        }
        yield <%= name %>s.isEmpty
            ? <%= name %>Loaded.copyWith(hasReachedMax: true)
            : <%= Name %>Loaded(<%= name %>s: new<%= Name %>s);
      } catch (e) {
        yield <%= Name %>Error(errorCode: e.hashCode, errorMessage: e.toString());
      }
    }
  }

  bool _hasReachedMax() {
    if (state is <%= Name %>Loaded) {
      return (state as <%= Name %>Loaded).hasReachedMax;
    }
    return false;
  }
}
