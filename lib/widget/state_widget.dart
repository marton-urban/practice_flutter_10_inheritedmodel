import 'package:flutter/material.dart';
import '/model/core_state.dart';

enum CoreAspect { backgroundColor, counter }

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({
    super.key,
    required this.child,
  });

  @override
  State<StateWidget> createState() => StateWidgetState();
}

class StateWidgetState extends State<StateWidget> {
  CoreState state = const CoreState();

  void incrementCounter() {
    final counter = state.counter + 1;
    final newState = state.copy(counter: counter);

    setState(() => state = newState);
  }

  void setColor(Color backgroundColor) {
    final newState = state.copy(backgroundColor: backgroundColor);

    setState(() => state = newState);
  }

  void setCounter(int counter) {
    final newState = state.copy(counter: counter);

    setState(() => state = newState);
  }

  @override
  Widget build(BuildContext context) => StateInheritedModel(
        state: state,
        stateWidget: this,
        child: widget.child,
      );
}

class StateInheritedModel extends InheritedModel<CoreAspect> {
  final CoreState state;
  final StateWidgetState stateWidget;

  const StateInheritedModel({
    super.key,
    required super.child,
    required this.state,
    required this.stateWidget,
  });

  static StateWidgetState of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<StateInheritedModel>()!)
          .stateWidget;

  static Color colorOf(BuildContext context) =>
      InheritedModel.inheritFrom<StateInheritedModel>(context,
              aspect: CoreAspect.backgroundColor)
          ?.state
          .backgroundColor as Color;

  static int counterOf(BuildContext context) =>
      InheritedModel.inheritFrom<StateInheritedModel>(context,
              aspect: CoreAspect.counter)
          ?.state
          .counter as int;

  @override
  bool updateShouldNotify(StateInheritedModel oldWidget) =>
      oldWidget.state != state;

  @override
  bool updateShouldNotifyDependent(
      StateInheritedModel oldWidget, Set<CoreAspect> dependencies) {
    if (state.backgroundColor != oldWidget.state.backgroundColor &&
        dependencies.contains(CoreAspect.backgroundColor)) {
      return true;
    }
    if (state.counter != oldWidget.state.counter &&
        dependencies.contains(CoreAspect.counter)) {
      return true;
    }
    return false;
  }
}
