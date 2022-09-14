import 'package:cataas_app/injector_widget.dart';
import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:cataas_app/presenter/constants/app_enums.dart';
import 'package:cataas_app/presenter/notifiers/cat_notifier.dart';
import 'package:cataas_app/presenter/widgets/body_builder.dart';
import 'package:cataas_app/presenter/widgets/csm_button.dart';
import 'package:cataas_app/presenter/widgets/csm_error.dart';
import 'package:cataas_app/presenter/widgets/csm_loading.dart';
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
            builder: (_, __) {
              final bool isOnData = notifier.appState == AppState.onData;

              return BodyBuilder(
                onData: Center(
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
                              child: (isOnData)
                                  ? Image.memory(
                                      notifier.data,
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
                ),
                onError: CsmError(
                  text: "Oh an error occurs,\nlets try again!",
                  icon: Icons.refresh,
                  onPressed: () => notifier.getCat(),
                ),
                onLoading: const CsmLoading(),
                notifier: notifier,
              );
            },
          )
        ],
      ),
      backgroundColor: AppColors.primary90,
    );
  }
}
