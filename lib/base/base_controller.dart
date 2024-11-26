
import 'dart:async';

class BaseStateController<Event, State> {
  State _state;
  final _stateController = StreamController<State>.broadcast();
  final _eventController = StreamController<Event>.broadcast();
  State get state => _state;
  Stream<State> get stateStream => _stateController.stream;

  BaseStateController({required State initialState})
      : _state = initialState {
    _eventController.stream.listen((event) {
      _state = handleEvent(event, _state);
      _stateController.add(_state);
    });
  }

  void addEvent(Event event) {
    _eventController.add(event);
  }

  State handleEvent(Event event, State currentState) {
    return currentState;
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}