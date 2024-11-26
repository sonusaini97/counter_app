import 'package:counter_app/base/my_injector.dart';
import 'package:flutter/material.dart';
import 'controller/counter_controller.dart';
import 'controller/counter_event.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {



  @override
  Widget build(BuildContext context) {
    final CounterController counterController = MyInjector.of<CounterController>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: StreamBuilder<int>(
          stream: counterController.stateStream,
          initialData: counterController.state,
          builder: (context, snapshot) {
            return Text(
              'Count: ${snapshot.data}',
              style: const TextStyle(fontSize: 30),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterController.addEvent(CounterEvent.increment),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => counterController.addEvent(CounterEvent.decrement),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}