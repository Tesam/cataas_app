import 'package:cataas_app/presenter/constants/app_enums.dart';
import 'package:flutter/material.dart';

class BodyBuilder extends StatelessWidget {
  const BodyBuilder({
    Key? key,
    required this.onError,
    required this.onLoading,
    required this.onData,
    required this.notifier,
  }) : super(key: key);
  final Widget onError;
  final Widget onLoading;
  final Widget onData;
  final dynamic notifier;

  @override
  Widget build(BuildContext context) {
    final bool isOnError = notifier.appState == AppState.onError;
    final bool isOnLoading = notifier.appState == AppState.onLoading;

    if(isOnError){
      return onError;
    }else if(isOnLoading){
      return onLoading;
    }else {
      return onData;
    }
  }
}
