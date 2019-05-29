// Define external data interaction
import 'package:counter/models/counter_model.dart';

class CounterRepository {
  Future<CounterModel> getIntFromSomewhere() async {
    return CounterModel(0);
  }
}
