import 'package:flutter/material.dart';

class CoreState {
  final int counter;
  final Color backgroundColor;

  const CoreState({
    this.counter = 0,
    this.backgroundColor = Colors.green,
  });

  CoreState copy({
    int? counter,
    Color? backgroundColor,
  }) =>
      CoreState(
        counter: counter ?? this.counter,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  @override
  bool operator ==(covariant CoreState other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          counter == other.counter &&
          backgroundColor == other.backgroundColor;

  @override
  int get hashCode => counter.hashCode ^ backgroundColor.hashCode;
}
