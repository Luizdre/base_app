import 'package:mobx/mobx.dart';

part 'notification_repository.g.dart';

class NotificationRepository = NotificationRepositoryBase
    with _$NotificationRepository;

abstract class NotificationRepositoryBase with Store {
  @observable
  int notifications = 0;

  void increment() {
    notifications++;
  }
}
