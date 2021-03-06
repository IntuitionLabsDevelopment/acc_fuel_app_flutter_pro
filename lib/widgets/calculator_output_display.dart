import 'package:acc_fuel_app_flutter_pro/utils/helpers/calculate_fuel.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/calculator_output_section.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/form/input_options.dart';
import 'package:acc_fuel_app_flutter_pro/widgets/unit_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget outputDivider(BuildContext context) {
  return Container(
      width: 2,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).highlightColor),
      ));
}

Widget calculatorOutputDisplay(BuildContext context) {
  return ValueListenableBuilder(
      valueListenable: usingStintNotifier,
      builder: (BuildContext context, bool usingStint, Widget? child) {
        return IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Theme.of(context).highlightColor),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                    valueListenable: riskyFuelNotifier,
                    builder:
                        (BuildContext context, int riskyFuel, Widget? child) {
                      return ValueListenableBuilder(
                          valueListenable: unitNotifier,
                          builder: (BuildContext context,
                              Map<String, String> units, Widget? child) {
                            return calculatorOutputSection(
                              title: AppLocalizations.of(context)!.risky,
                              value:
                                  "${riskyFuel.toString()}${units['short']!}",
                            );
                          });
                    }),
                outputDivider(context),
                ValueListenableBuilder(
                    valueListenable: safeFuelNotifier,
                    builder:
                        (BuildContext context, int safeFuel, Widget? child) {
                      return ValueListenableBuilder(
                          valueListenable: unitNotifier,
                          builder: (BuildContext context,
                              Map<String, String> units, Widget? child) {
                            return calculatorOutputSection(
                              title: AppLocalizations.of(context)!.safe,
                              value: "${safeFuel.toString()}${units['short']!}",
                            );
                          });
                    }),
                Visibility(
                  visible: usingStint,
                  child: outputDivider(context),
                ),
                Visibility(
                  visible: usingStint,
                  child: ValueListenableBuilder(
                      valueListenable: estimatedLapsNotifier,
                      builder: (BuildContext context, int estimatedLaps,
                          Widget? child) {
                        return calculatorOutputSection(
                          title: AppLocalizations.of(context)!.estLaps,
                          value: estimatedLaps.toString(),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      });
}
