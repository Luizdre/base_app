import 'package:mobx/mobx.dart';
import 'package:firebase_performance/firebase_performance.dart';

class PerformanceRepository with Store {
  final FirebasePerformance _firebasePerformance = FirebasePerformance.instance;

  Future<void> newTrace(String name, int value) async {
    Trace newTrace = _firebasePerformance.newTrace(name);
    await newTrace.start();
    newTrace.setMetric(name, value);
    await newTrace.stop();
  }
}
