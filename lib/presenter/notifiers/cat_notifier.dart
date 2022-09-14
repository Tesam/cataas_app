import 'dart:typed_data';

import 'package:cataas_app/domain/use_cases/get_cat.dart';
import 'package:cataas_app/presenter/constants/app_enums.dart';
import 'package:cataas_app/presenter/notifiers/notifier_interface.dart';
import 'package:flutter/foundation.dart';

class CatNotifier extends ChangeNotifier implements INotifier<Uint8List>{
  CatNotifier(this._getCat){
    setAppState(state: AppState.onInitialData);
  }
  final GetCat _getCat;

  late Uint8List _cat;
  late AppState _appState;

  @override
  AppState get appState => _appState;
  @override
  Uint8List get data => _cat;

  void getCat() async {
    setAppState(state: AppState.onLoading);

    final Uint8List? actualCat = await _getCat.getCat();

    if(actualCat == null){
      setAppState(state: AppState.onError);
    } else {
      _cat = actualCat;
      setAppState(state: AppState.onData);
    }
  }

  void setAppState({required AppState state}){
    _appState = state;
    notifyListeners();
  }
}