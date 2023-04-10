import 'package:firebase/app/infra/repositories/analytics_repository.dart';
import 'package:firebase/app/infra/repositories/cloud_messaging_repository.dart';
import 'package:firebase/app/infra/repositories/crashlytics_repository.dart';
import 'package:firebase/app/infra/repositories/local_notification_repository.dart';
import 'package:firebase/app/infra/repositories/local_storage_repository.dart';
import 'package:firebase/app/infra/repositories/notification_repository/notification_repository.dart';
import 'package:firebase/app/shared/components/dio_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => LocalNotificationRepository()),
    Bind.singleton((i) => CloudMessagingRepository(i.get())),
    Bind.singleton((i) => AnalyticsRepository()),
    Bind.singleton((i) => CrashlyticsRepository()),
    Bind.singleton((i) => DioClient()),
    Bind.singleton((i) => LocalStorageRepository()),
    Bind.singleton((i) => NotificationRepository())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
