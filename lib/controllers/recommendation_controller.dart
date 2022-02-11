import 'package:flutter/material.dart';

class RecommendationController {
  final BuildContext context;

  RecommendationController({required this.context}) {
    ///initialise required stuff here
  }

  Future<void> getRecommendationData(
      ValueNotifier<bool> loadingNotifier) async {
    loadingNotifier.value = true;

    ///mimicking network api call behavior
    await Future.delayed(const Duration(seconds: 3), () {
      loadingNotifier.value = false;
    });
  }
}
