// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PokeApiFormated {
  final int count;
  final String next;
  final String previous;
  final List results;
  PokeApiFormated({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  PokeApiFormated copyWith({
    int? count,
    String? next,
    String? previous,
    List? results,
  }) {
    return PokeApiFormated(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'next': next,
      'previous': previous,
      'results': results,
    };
  }

  factory PokeApiFormated.fromMap(Map<String, dynamic> map) {
    return PokeApiFormated(
      count: map['count'] as int,
      next: map['next'] as String,
      previous: map['previous'] as String,
      results: map['results'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokeApiFormated.fromJson(String source) =>
      PokeApiFormated.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokeApiFormated(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(covariant PokeApiFormated other) {
    if (identical(this, other)) return true;

    return other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}
