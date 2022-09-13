import 'dart:typed_data';

import 'package:cataas_app/domain/use_cases/get_cat.dart';
import 'package:cataas_app/presenter/constants/app_enums.dart';
import 'package:flutter/foundation.dart';

class CatNotifier extends ChangeNotifier {
  CatNotifier(this._getCat);
  final GetCat _getCat;

  late Uint8List _cat;
  AppState _appState = AppState.initial;


  Uint8List get cat => _cat;
  AppState get appState => _appState;

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