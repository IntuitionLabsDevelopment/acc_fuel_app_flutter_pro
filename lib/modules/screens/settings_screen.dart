import 'package:acc_fuel_app_flutter_pro/utils/ui/app_dialogs.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/buttons/clear_data_button.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/buttons/github_button.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/buttons/leave_review_button.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/theme_options_dropdown.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/language_dropdown.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/unit_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget spacer() {
  return const SizedBox(
    height: 15,
  );
}

Widget settingsScreen(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          unitSwitch(context),
          spacer(),
          themeOptions(),
          spacer(),
          languageDropdown(),
          spacer(),
          githubButton(context),
          spacer(),
          leaveReviewButton(context),
          spacer(),
          clearDataButton(context),
          spacer(),
          ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.heart),
              onPressed: () {
                migrationDialog(context);
              },
              label: Text(AppLocalizations.of(context)!.thankYou))
        ],
      ),
    ),
  );
}
