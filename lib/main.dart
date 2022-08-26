import 'package:cataas_app/injector_widget.dart';
import 'package:cataas_app/presenter/screens/cat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  var injector = InjectorWidget(child : const MyApp());
  injector.init();

  runApp(injector);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cat Factory',
      home: CatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
