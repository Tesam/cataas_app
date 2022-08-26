import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:cataas_app/presenter/widgets/csm_show_up.dart';
import 'package:flutter/material.dart';

const _panelTransition = Duration(milliseconds: 400);

class PayWallScreen extends StatefulWidget {
  const PayWallScreen({Key? key}) : super(key: key);

  @override
  _PayWallScreenState createState() => _PayWallScreenState();
}

class _PayWallScreenState extends State<PayWallScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Premium",
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primary,
      ),
      backgroundColor: AppColors.primary,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CSMShowUp(
            delay: 500,
            child: AnimatedContainer(
              duration: _panelTransition,
              height: _size.height,
              width: _size.width,
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: AppColors.primary95),
              curve: Curves.fastOutSlowIn,
              child: const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "This feature is not available in your country",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          CSMShowUp(
              delay: 1300,
              child: AnimatedContainer(
                  duration: _panelTransition,
                  height: _size.height * 0.72,
                  width: _size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                      color: AppColors.primary90),
                  curve: Curves.fastOutSlowIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/sad_emoticon.png',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "We're sorry! this feature will be available soon in your country",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: AppColors.textColor, fontSize: 16),
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
