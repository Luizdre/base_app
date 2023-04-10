import 'package:firebase/app/shared/exceptions/analytics_exception.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsRepository with Store {
  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics.instance;

  Future<void> logEvent(String name, Map<String, dynamic> params) async {
    try {
      await _firebaseAnalytics.logEvent(name: name, parameters: params);
    } catch (e) {
      throw AnalyticsException(
          '[ AnalyticsException ] - Failed to launch logEvent');
    }
  }
}
