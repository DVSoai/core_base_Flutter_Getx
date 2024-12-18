
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/image_constants.dart';
import '../../core/constants/padding_constants.dart';
import '../../core/constants/sized_box_constants.dart';
import '../../core/l10n/locale_keys.g.dart';
import 'welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
            padding: PaddingConstants.padAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBoxConstants.sizedBoxH86,
                _buildWelcomeImage(context),
                SizedBoxConstants.sizedBoxH44,
                _buildLogoWelcome(context),
                SizedBoxConstants.sizedBoxH24,
                _buildWelcomeTitle(context),
                SizedBoxConstants.sizedBoxH48,
                _buildWelcomeButton(context),
                SizedBoxConstants.sizedBoxH45,
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(context),
          ),
        );
      },
    );
  }

  Widget _buildWelcomeImage(BuildContext context) {
    return Image.asset(
      ImageConstants.welcomeApp,
      height: 300,
    );
  }

  Widget _buildLogoWelcome(BuildContext context) {
    return Image.asset(
      ImageConstants.icLogoMini,
      height: 26,
    );
  }

  Widget _buildWelcomeTitle(BuildContext context) {
    return Text(
      // tr(LocaleKeys.),
      'chưa làm g',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF616161),
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
    );
  }

  Widget _buildWelcomeButton(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBoxConstants.sizedBoxH18,
          _buildButtonlogin(context),
        ],
      ),
    );
  }


  Widget _buildButtonlogin(BuildContext context) {
    return GestureDetector(
      // onTap: controller.gotoLoginPage,
      child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF0070FF),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              tr(LocaleKeys.login),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0070FF),
              ),
            ),
          )),
    );
  }
}
