import 'package:flutter/material.dart';
import 'package:greentick_assignment/constants/colors.dart';
import 'package:greentick_assignment/controllers/recommendation_controller.dart';
import 'package:greentick_assignment/presentation/skeletons/recommendation_card_skeleton.dart';
import 'package:greentick_assignment/presentation/widgets/recommendation_list.dart';
import 'package:greentick_assignment/providers/recommendation_provider.dart';
import 'package:greentick_assignment/utils/screen_util.dart';
import 'package:provider/provider.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  late final RecommendationController _controller;
  late final RecommendationProvider _recommendationProvider;
  final ValueNotifier<bool> loadingNotifier = ValueNotifier(false);

  @override
  void initState() {
    _controller = RecommendationController(context: context);
    _recommendationProvider =
        Provider.of<RecommendationProvider>(context, listen: false);

    ///getting recommendation list data
    _controller.getRecommendationData(loadingNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///initializing screenutil to get screen dimension
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);

    return SafeArea(
      child: Scaffold(
        key: const Key('scaffold'),
        backgroundColor: ColorsBase.backGroundColor,
        body: Column(
          key: const Key('mainColumn'),
          children: [
            ValueListenableBuilder(
              valueListenable: loadingNotifier,
              builder: (context, bool loading, child) {
                if (loading) {
                  ///show loading skeleton
                  return RecommendationCardSkeleton(
                    key: const Key('loadingSkeleton'),
                  );
                }

                ///show horizontal listview
                return RecommendationList(
                  key: const Key('recommendationList'),
                  recommendationList:
                      _recommendationProvider.recommendationList,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
