import 'package:cataas_app/presenter/constants/app_enums.dart';

abstract class INotifier <T> {
  AppState get appState;
  T get data;
}