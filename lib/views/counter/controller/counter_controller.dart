import 'package:counter_app/base/base_controller.dart';

import 'counter_event.dart';

class CounterController extends BaseStateController<CounterEvent, int> {
  CounterController() : super(initialState: 0);

  @override
  int handleEvent(CounterEvent event, int currentState) {
    switch (event) {
      case CounterEvent.increment:
        return currentState + 1;
      case CounterEvent.decrement:
        return currentState - 1;
      default:
        return currentState;
    }
  }
}