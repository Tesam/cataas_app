import 'package:cataas_app/data/datasources/remote/cat_service.dart';
import 'package:cataas_app/data/datasources/remote/http_api_client.dart';
import 'package:cataas_app/data/repositories/cat_repository_impl.dart';
import 'package:cataas_app/domain/repositories/cat_repository.dart';
import 'package:cataas_app/domain/use_cases/get_cat.dart';
import 'package:cataas_app/presenter/notifier/cat_notifier.dart';
import 'package:flutter/material.dart';

class InjectorWidget extends InheritedWidget {
  InjectorWidget(
      {Key? key, required Widget child,})
      : super(key: key, child: child);

  late CatRepository catRepository;
  late CatService catService;
  late HttpApiClient httpApiClient;
  late GetCat getCatUseCase;
  late CatNotifier catNotifier;

  void init() async {
    httpApiClient = const HttpApiClient();
    catService = CatService(httpApiClient);
    catRepository = CatRepositoryImpl(catService);
    getCatUseCase = GetCat(catRepository);
    catNotifier =  CatNotifier(getCatUseCase);
  }

  @override
  bool updateShouldNotify(oldWidget) => false;

  static InjectorWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InjectorWidget>();
}
