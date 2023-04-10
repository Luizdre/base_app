import 'dart:async';
import 'package:firebase/app/shared/exceptions/notification_exception.dart';
import 'package:firebase/app/shared/components/constants.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LocalNotificationRepository {
  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static LocalNotificationRepository instance = LocalNotificationRepository();

  final initializationSettings = const InitializationSettings(
      android: AndroidInitializationSettings(NOTIFICATION_APP_ICON));

  final int _notificationId = 1;

  LocalNotificationRepository() {
    _initializeRepository();
  }

  Future<void> showNotification(RemoteNotification notification) async {
    NotificationDetails notificationDetails = await _notificationDetails();

    if (_checkIfNotificationIsNotEmpty(notification)) return;

    try {
      await _localNotificationsPlugin.show(_notificationId, notification.title,
          notification.body, notificationDetails);
    } catch (e) {
      throw NotificationException(
          '[ NotificationRepository ] - Failed to show notification $e');
    }
  }

  bool _checkIfNotificationIsNotEmpty(RemoteNotification notification) {
    if (_checkIfNotificationIsNull(notification)) return true;

    String title = notification.title ?? '';
    String body = notification.body ?? '';

    return title.isEmpty || body.isEmpty;
  }

  bool _checkIfNotificationIsNull(RemoteNotification? notification) {
    return notification == null;
  }

  Future<NotificationDetails> _notificationDetails() async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
            NOTIFICATION_CHANNEL_ID, NOTIFICATION_CHANNEL_NAME,
            importance: Importance.max, priority: Priority.high);

    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails(
            threadIdentifier: NOTIFICATION_THREAD_ID);
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

    return platformChannelSpecifics;
  }

  Future<void> _initializeRepository() async =>
      await _localNotificationsPlugin.initialize(initializationSettings);
}
