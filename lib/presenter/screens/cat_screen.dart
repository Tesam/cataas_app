import 'dart:typed_data';

import 'package:cataas_app/injector_widget.dart';
import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:cataas_app/presenter/widgets/wallpaper.dart';
import 'package:flutter/material.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "Cat Factory",
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const Wallpaper(),
          FutureBuilder(
            future: InjectorWidget.of(context)!
                .catRepository
                .getCat(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              } else if (snapshot.hasData) {
                return  Center(
                  child: Container(
                      margin: const EdgeInsets.all(25),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.primary99),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 300,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.memory(
                                  snapshot.data! as Uint8List,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding:
                            const EdgeInsets.only(right: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => setState(() {}),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 14),
                                        primary: AppColors.primary,
                                      ),
                                      child: const Text(
                                        "Create a Cat",
                                        style: TextStyle(
                                            color: AppColors.primary90),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                );
              }
            },
          )
        ],
      ),
      backgroundColor: AppColors.primary90,
    );
  }
}
