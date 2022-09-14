import 'dart:typed_data';

import 'package:cataas_app/domain/use_cases/get_cat.dart';
import 'package:cataas_app/presenter/constants/app_enums.dart';
import 'package:cataas_app/presenter/notifiers/notifier_interface.dart';
import 'package:flutter/foundation.dart';

class CatNotifier extends ChangeNotifier implements INotifier<Uint8List>{
  CatNotifier(this._getCat);
  final GetCat _getCat;

  late Uint8List _cat;
  AppState _appState = AppState.onInitialData;

  @override
  AppState get appState => _appState;
  @override
  Uint8List get data => _cat;

  void getCat() async {
    _appState = AppState.onLoading;
    notifyListeners();

    final Uint8List? actualCat = await _getCat.getCat();

    if(actualCat == null){
      _appState = AppState.onError;
      notifyListeners();
    }else{
      _cat = actualCat;
      _appState = AppState.onData;
      notifyListeners();
    }
  }
}