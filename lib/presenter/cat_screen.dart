import 'dart:typed_data';

import 'package:cataas_app/injector_widget.dart';
import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:cataas_app/presenter/constants/app_enums.dart';
import 'package:cataas_app/presenter/widgets/csm_circular_button.dart';
import 'package:flutter/material.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  FilterType filterType = FilterType.mono;
  String imageText = "Hi!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text(
            "Cat Factory",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: InjectorWidget.of(context)!.catRepository.getCat(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColors.primary90),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.memory(
                                          snapshot.data! as Uint8List,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const CSMCircularButton(
                                                icon: Icon(
                                              Icons.photo_filter,
                                            )),
                                            const CSMCircularButton(
                                                icon: Icon(
                                              Icons.title,
                                            )),
                                            const Spacer(),
                                            ElevatedButton(
                                              onPressed: () => setState(() {}),
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                elevation: 0,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25,
                                                        vertical: 12),
                                                primary: AppColors.primary95,
                                              ),
                                              child: const Text(
                                                "Create Cat",
                                                style: TextStyle(
                                                    color: AppColors.textColor),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, bottom: 5, top: 10),
                                          child: Text(
                                            "Filter type",
                                            style: TextStyle(
                                              color: AppColors.textColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            "Mono",
                                            style: TextStyle(
                                                color: AppColors.textColor,
                                                fontSize: 14),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: Text(
                                            "Text",
                                            style: TextStyle(
                                              color: AppColors.textColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            "Hi!",
                                            style: TextStyle(
                                                color: AppColors.textColor,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.primary90),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                title: const Text(
                                  "Share",
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                leading: const Icon(
                                  Icons.share,
                                  color: AppColors.textColor,
                                ),
                                onTap: () {
                                },
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 0),
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                              ListTile(
                                title: const Text(
                                  "Download",
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                leading: const Icon(
                                  Icons.download,
                                  color: AppColors.textColor,
                                ),
                                onTap: () {
                                },
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 0),
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                );
              }
            }));
  }
}
