import 'package:counter_app/base/my_injector.dart';
import 'package:counter_app/views/counter/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'views/counter/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyInjector(
      dependencies:
        {
          CounterController: CounterController(),
        },

      child: const MaterialApp(
        title: 'Counter App',
        home: CounterPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
