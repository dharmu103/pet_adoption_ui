import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

Future showConfettiDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  required Color barrierColor,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  Alignment confettiAlignment = Alignment.center,
}) {
  final pageBuilder = Builder(
    builder: builder,
  );
  ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 3));
  _confettiController.play();
  return showDialog(
    context: context,
    builder: (BuildContext buildContext) {
      return Stack(
        children: [
          pageBuilder,
          Align(
            alignment: confettiAlignment,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.1,
            ),
          ),
        ],
      );
    },
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    // routeSettings: routeSettings,
  );
}
