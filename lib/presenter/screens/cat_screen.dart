import 'dart:typed_data';

import 'package:cataas_app/injector_widget.dart';
import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:cataas_app/presenter/constants/app_enums.dart';
import 'package:cataas_app/presenter/utils/utils.dart';
import 'package:cataas_app/presenter/widgets/csm_chip.dart';
import 'package:cataas_app/presenter/widgets/csm_circular_button.dart';
import 'package:cataas_app/presenter/widgets/wallpaper.dart';
import 'package:flutter/material.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  FilterType filterType = FilterType.paint;
  String imageText = "Hi!";

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
                                    padding:
                                    const EdgeInsets.only(right: 10, top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CSMCircularButton(
                                              icon: const Icon(
                                                Icons.photo_filter,
                                              ),
                                              onPressed: () => showDialog<String>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  FilterType dialogFilterType =
                                                      filterType;
                                                  return StatefulBuilder(builder:
                                                      (context, setDialogState) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                        'Select a Filter',
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .textColor),
                                                      ),
                                                      content: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              CSMChip(
                                                                widgetType:
                                                                FilterType.mono,
                                                                selectedType:
                                                                dialogFilterType,
                                                                title: AppUtils
                                                                    .capitalizeFirstLetter(
                                                                    FilterType
                                                                        .mono
                                                                        .name),
                                                                onTap: () =>
                                                                    setDialogState(
                                                                            () {
                                                                          dialogFilterType =
                                                                              FilterType
                                                                                  .mono;
                                                                        }),
                                                              ),
                                                              CSMChip(
                                                                widgetType:
                                                                FilterType
                                                                    .paint,
                                                                selectedType:
                                                                dialogFilterType,
                                                                title: AppUtils
                                                                    .capitalizeFirstLetter(
                                                                    FilterType
                                                                        .paint
                                                                        .name),
                                                                onTap: () =>
                                                                    setDialogState(
                                                                            () {
                                                                          dialogFilterType =
                                                                              FilterType
                                                                                  .paint;
                                                                        }),
                                                              ),
                                                              CSMChip(
                                                                widgetType:
                                                                FilterType.blur,
                                                                selectedType:
                                                                dialogFilterType,
                                                                title: AppUtils
                                                                    .capitalizeFirstLetter(
                                                                    FilterType
                                                                        .blur
                                                                        .name),
                                                                onTap: () =>
                                                                    setDialogState(
                                                                            () {
                                                                          dialogFilterType =
                                                                              FilterType
                                                                                  .blur;
                                                                        }),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              CSMChip(
                                                                widgetType:
                                                                FilterType
                                                                    .negative,
                                                                selectedType:
                                                                dialogFilterType,
                                                                title: AppUtils
                                                                    .capitalizeFirstLetter(
                                                                    FilterType
                                                                        .negative
                                                                        .name),
                                                                onTap: () =>
                                                                    setDialogState(
                                                                            () {
                                                                          dialogFilterType =
                                                                              FilterType
                                                                                  .negative;
                                                                        }),
                                                              ),
                                                              CSMChip(
                                                                widgetType:
                                                                FilterType
                                                                    .sepia,
                                                                selectedType:
                                                                dialogFilterType,
                                                                title: AppUtils
                                                                    .capitalizeFirstLetter(
                                                                    FilterType
                                                                        .sepia
                                                                        .name),
                                                                onTap: () =>
                                                                    setDialogState(
                                                                            () {
                                                                          dialogFilterType =
                                                                              FilterType
                                                                                  .sepia;
                                                                        }),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                context,
                                                              ),
                                                          child: const Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .textColor),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            setFilter(
                                                                dialogFilterType);
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Text(
                                                            'SELECT',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .primary,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                                },
                                              ),
                                            ),
                                            CSMCircularButton(
                                                icon: const Icon(
                                                  Icons.title,
                                                ),
                                                onPressed: () => showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    TextEditingController
                                                    textController =
                                                    TextEditingController();
                                                    return StatefulBuilder(
                                                        builder: (context,
                                                            setDialogState) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                              'Write a text',
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .textColor),
                                                            ),
                                                            content: Column(
                                                              mainAxisSize:
                                                              MainAxisSize.min,
                                                              children: [
                                                                TextField(
                                                                  controller:
                                                                  textController,
                                                                  maxLength: 25,
                                                                ),
                                                              ],
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                      context,
                                                                    ),
                                                                child: const Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .textColor),
                                                                ),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  setText(
                                                                      textController
                                                                          .text);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                  'SELECT',
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .primary,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
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
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 25, vertical: 12),
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
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Text(
                                            AppUtils.capitalizeFirstLetter(
                                                filterType.name),
                                            style: const TextStyle(
                                                color: AppColors.textColor,
                                                fontSize: 14),
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                          EdgeInsets.only(left: 15, top: 10),
                                          child: Text(
                                            "Text",
                                            style: TextStyle(
                                              color: AppColors.textColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Text(
                                            imageText,
                                            style: const TextStyle(
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
                    ],
                  ),
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

  void setFilter(FilterType value) {
    setState(() {
      filterType = value;
    });
  }

  void setText(String value) {
    setState(() {
      imageText = value;
    });
  }
}
