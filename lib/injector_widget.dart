import 'package:cataas_app/data/datasources/remote/cat_service.dart';
import 'package:cataas_app/data/repositories/cat_repository_impl.dart';
import 'package:cataas_app/domain/repositories/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InjectorWidget extends InheritedWidget {
  InjectorWidget(
      {Key? key, required Widget child,})
      : super(key: key, child: child);

  late CatRepository catRepository;
  late CatService catService;

  void init() async {
    catService = CatService(http.Client());
    catRepository = CatRepositoryImpl(catService);
  }

  @override
  bool updateShouldNotify(oldWidget) => false;

  static InjectorWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InjectorWidget>();
}
