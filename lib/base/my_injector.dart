
import 'package:flutter/widgets.dart';

class MyInjector extends InheritedWidget {
  final Map<Type, dynamic> dependencies;

  const MyInjector({
    super.key,
    required this.dependencies,
    required super.child,
  });

  static T of<T>(BuildContext context) {
    final MyInjector? result = context.dependOnInheritedWidgetOfExactType<MyInjector>();
    return result!.dependencies[T] as T;
  }

  @override
  bool updateShouldNotify(MyInjector oldWidget) {
    return oldWidget.dependencies != dependencies;
  }
}