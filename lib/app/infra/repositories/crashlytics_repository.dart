import 'package:firebase/app/shared/exceptions/crashlytics_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsRepository with Store {
  final FirebaseCrashlytics _firebaseCrashlytics = FirebaseCrashlytics.instance;

  CrashlyticsRepository() {
    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      try {
        await _firebaseCrashlytics.recordFlutterError(errorDetails);
        print('[Crashlytics Repository] - Registering Flutter error');
      } catch (e) {
        throw CrashlyticsException(
            '[ CrashlyticsException ] - Failed to recordFlutterError');
      }
    };

    PlatformDispatcher.instance.onError = (exception, stackTrace) {
      try {
        _firebaseCrashlytics.recordError(exception, stackTrace, fatal: true);
        print('[Crashlytics Repository] - Registering Flutter Fatal error');
        return true;
      } catch (e) {
        throw CrashlyticsException(
            '[ CrashlyticsException ] - Failed to recordError');
      }
    };
  }
}
