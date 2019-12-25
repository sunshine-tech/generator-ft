import 'package:equatable/equatable.dart';
import '<%= name %>_model.dart';

abstract class <%= Name %>State extends Equatable {
  const <%= Name %>State();

  @override
  List<Object> get props => [];
}

class <%= Name %>Uninitialized extends <%= Name %>State {
  @override
  String toString() => '<%= Name %>Uninitialized';
}

class <%= Name %>Error extends <%= Name %>State {
  final int errorCode;
  final String errorMessage;

  <%= Name %>Error({this.errorCode, this.errorMessage});

  @override
  List<Object> get props => [errorCode, errorMessage];

  @override
  String toString() =>
      '<%= Name %>Error {errorCode: $errorCode, errorMessage: $errorMessage}';
}

class <%= Name %>Loading extends <%= Name %>State {
  @override
  String toString() => '<%= Name %>Loading';
}

class <%= Name %>Loaded extends <%= Name %>State {
  final List<<%= Name %>> <%= name %>s;
  final bool hasReachedMax;

  @override
  List<Object> get props => [<%= name %>s, hasReachedMax];

  <%= Name %>Loaded({this.<%= name %>s, this.hasReachedMax});

  <%= Name %>Loaded copyWith({
    List<<%= Name %>> <%= name %>s,
    bool hasReachedMax,
  }) {
    return <%= Name %>Loaded(
        <%= name %>s: <%= name %>s ?? this.<%= name %>s,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  bool isReachedMax() {
    if (hasReachedMax != null) {
      return hasReachedMax;
    }
    return false;
  }

  @override
  String toString() =>
      '<%= Name %>Loaded { <%= name %>s: ${<%= name %>s.length}, hasReachedMax: $hasReachedMax}';
}

class <%= Name %>Added extends <%= Name %>State {
  final List<<%= Name %>> <%= name %>s;

  <%= Name %>Added({this.<%= name %>s});
}
