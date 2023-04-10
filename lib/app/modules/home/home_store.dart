import 'package:firebase/app/infra/repositories/notification_repository/notification_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int counter = 0;

  dynamic teste() {}

  final NotificationRepository notificationRepository;

  HomeStoreBase(this.notificationRepository);

  Future<void> increment() async {
    counter = counter + 1;
  }
}
