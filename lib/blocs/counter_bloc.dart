import 'package:bloc/bloc.dart';
import 'package:counter/models/counter_model.dart';
import 'package:counter/resources/counter_provider.dart';

// Define the events to operate on the counter model class
enum CounterEvent { increment, decrement, getExternal }

// The BLoC model defining the data and how it is updated (reduce functions)
class CounterBloc extends Bloc<CounterEvent, CounterModel> {
  final CounterRepository repo = CounterRepository();

  @override
  CounterModel get initialState => CounterModel(0);

  @override
  Stream<CounterModel> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterModel(currentState.value + 1);
        break;
      case CounterEvent.decrement:
        yield CounterModel(currentState.value - 1);
        break;
      case CounterEvent.getExternal:
        yield await repo.getIntFromSomewhere();
        break;
    }
  }
}
