import 'package:cataas_app/injector_widget.dart';
import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:cataas_app/presenter/constants/app_enums.dart';
import 'package:cataas_app/presenter/notifiers/cat_notifier.dart';
import 'package:cataas_app/presenter/widgets/csm_button.dart';
import 'package:cataas_app/presenter/widgets/wallpaper.dart';
import 'package:flutter/material.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CatNotifier notifier = InjectorWidget.of(context)!.catNotifier;
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
          AnimatedBuilder(
            animation: notifier,
            builder: (context, _) {
              if (notifier.appState == AppState.onError) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Oh an error occurs,\nlets try again!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          onPressed: () => notifier.getCat(),
                          icon: const Icon(Icons.refresh, size: 40,))
                    ],
                  ),
                );
              } else if (notifier.appState == AppState.onLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              }

              return Center(
                child: Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.primary99),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 300,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: (notifier.appState == AppState.onData)
                                ? Image.memory(
                              notifier.cat,
                              fit: BoxFit.fill,
                            )
                                : Image.asset('assets/cat_factory_icon.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CsmButton(
                            onPressed: () => notifier.getCat(),
                            title: "Create a Cat"),
                      ],
                    )),
              );
            },
          )
        ],
      ),
      backgroundColor: AppColors.primary90,
    );
  }
}
