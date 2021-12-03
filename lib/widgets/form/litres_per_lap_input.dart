import 'package:acc_fuel_app_flutter_pro/widgets/form/double_field_input.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/form/fields_section.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/unit_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final TextEditingController litresInput = TextEditingController();

Widget litresPerLapField() {
  return ValueListenableBuilder(
      valueListenable: unitNotifier,
      builder:
          (BuildContext context, Map<String, String> units, Widget? child) {
        return fieldsSection(
            "${units['long']! == 'gallons' ? AppLocalizations.of(context)!.gallons : AppLocalizations.of(context)!.litres} ${AppLocalizations.of(context)!.perLap}",
            [
              Expanded(
                  child: doubleFieldInput(
                      controller: litresInput,
                      labelText: units['short']!,
                      maxLength: 5)),
            ]);
      });
}
