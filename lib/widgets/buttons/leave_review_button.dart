import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<bool> isReviewAvailable() async {
  final InAppReview inAppReview = InAppReview.instance;
  return await inAppReview.isAvailable();
}

Widget leaveReviewButton(BuildContext context, {bool fullWidth = false}) {
  final InAppReview inAppReview = InAppReview.instance;

  return FutureBuilder<bool>(
    future: isReviewAvailable(), // a previously-obtained Future<bool> or null
    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      Widget child = const SizedBox.shrink();
      if (snapshot.hasData) {
        child = Visibility(
          visible: snapshot.data as bool && Platform.isAndroid,
          child: ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.starHalfAlt),
              style: fullWidth
                  ? ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                    )
                  : null,
              onPressed: () async {
                Navigator.of(context).pop();
                inAppReview.openStoreListing();
              },
              label: Text(AppLocalizations.of(context)!.leaveReview)),
        );
      }
      return child;
    },
  );
}
