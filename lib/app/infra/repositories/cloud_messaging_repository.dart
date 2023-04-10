import 'package:firebase/app/shared/exceptions/cloud_exception.dart';
import 'package:firebase/app/infra/repositories/local_notification_repository.dart';
import 'package:firebase/app/infra/repositories/notification_repository/notification_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobx/mobx.dart';

class CloudMessagingRepository {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final LocalNotificationRepository _localNotificationRepository =
      LocalNotificationRepository.instance;
  final NotificationRepository notificationRepository;

  CloudMessagingRepository(this.notificationRepository) {
    initializeRepository();
  }

  Future<void> initializeRepository() async {
    try {
      await messaging.requestPermission(alert: true, sound: true, badge: true);
      FirebaseMessaging.onMessage.listen(_listenForegroundMessage);
      FirebaseMessaging.onBackgroundMessage(_listenBackgroundMessage);
      FirebaseMessaging.instance.getToken().then((value) => print(value));
    } catch (e) {
      throw CloudException(
          '[ CloudMessaging Exception ] - Failed to initialize repository');
    }
  }

  @action
  void _listenForegroundMessage(RemoteMessage message) async {
    await _localNotificationRepository.showNotification(message.notification!);
    notificationRepository.increment();
    print('[ CloudMessaging ] - Received Foreground Message');
  }
}

Future<void> _listenBackgroundMessage(RemoteMessage message) async {
  LocalNotificationRepository localNotificationRepository =
      LocalNotificationRepository.instance;
  await localNotificationRepository.showNotification(message.notification!);

  print('[ CloudMessaging ] - Received Background Message');
}
