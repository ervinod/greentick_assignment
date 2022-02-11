import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:greentick_assignment/constants/colors.dart';
import 'package:greentick_assignment/constants/strings.dart';
import 'package:greentick_assignment/models/recommendation_model.dart';
import 'package:greentick_assignment/utils/screen_util.dart';
import 'package:greentick_assignment/utils/utility.dart';
import 'package:intl/intl.dart';

class RecommendationList extends StatelessWidget {
  final List<RecommendationModel> recommendationList;

  const RecommendationList({
    Key? key,
    required this.recommendationList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return Column(
      children: [
        Divider(
          color: ColorsBase.green,
          thickness: 1,
        ),
        SizedBox(
          height: 20,
        ),
        ListHeader(
          key: const Key('listHeader'),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: _screenUtil.setHeight(225),
          width: getWidth(context),
          child: ListView.separated(
            key: Key("recommendationListView"),
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            padding: const EdgeInsets.only(
              left: 15,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: recommendationList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RecommendationItem(
                key: Key('listItem$index'),
                model: recommendationList[index],
              );
            },
          ),
        ),
        Divider(
          color: ColorsBase.green.withOpacity(0.5),
          thickness: 2,
        ),
      ],
    );
  }
}

class RecommendationItem extends StatelessWidget {
  final RecommendationModel model;

  const RecommendationItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context) * 0.70,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorsBase.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorsBase.darkBlack.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                width: getWidth(context),
                height: 180,
                imageUrl: model.placeImage,
                fit: BoxFit.cover,
                key: const Key('placeImage'),
                placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                    color: ColorsBase.light200Grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.placeName,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(16) as double,
                    color: ColorsBase.green,
                    fontFamily: StringConstants.fontRobotoRegular,
                    height: 1.2,
                  ),
                  key: const Key('placeName'),
                ),
                Text(
                  ", ${model.cityName}",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(16) as double,
                    color: ColorsBase.green,
                    fontFamily: StringConstants.fontRobotoRegular,
                    height: 1.2,
                  ),
                  key: const Key('placeLocation'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.thumb_up,
                color: ColorsBase.green,
                size: 19,
                key: const Key('likeIcon'),
              ),
              Text(
                NumberFormat.compact().format(model.likes),
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(13) as double,
                  color: ColorsBase.darkBlack.withOpacity(0.4),
                  height: 1.2,
                ),
                key: const Key('likeCount'),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.thumb_down,
                color: ColorsBase.red,
                size: 19,
                key: const Key('dislikeIcon'),
              ),
              Text(
                NumberFormat.compact().format(model.dislikes),
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(13) as double,
                  color: ColorsBase.darkBlack.withOpacity(0.4),
                ),
                key: const Key('dislikeCont'),
              ),
              const SizedBox(
                width: 15,
              ),
              RatingBarIndicator(
                itemPadding: EdgeInsets.zero,
                rating: model.rating,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: ColorsBase.green,
                ),
                itemCount: 5,
                itemSize: 16.0,
                direction: Axis.horizontal,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                model.rating.toString(),
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(13) as double,
                  color: ColorsBase.darkBlack.withOpacity(0.4),
                  height: 1.2,
                ),
                key: const Key('rating'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(
            Icons.thumb_up,
            color: ColorsBase.red,
            size: 19,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            StringConstants.recommendedForYou,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(13) as double,
              color: ColorsBase.red.withOpacity(0.9),
              fontFamily: StringConstants.fontRobotoBold,
              height: 1.2,
            ),
          ),
          const Spacer(),
          Text(
            StringConstants.viewAll,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(13) as double,
              color: ColorsBase.red.withOpacity(0.9),
              fontFamily: StringConstants.fontRobotoRegular,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
