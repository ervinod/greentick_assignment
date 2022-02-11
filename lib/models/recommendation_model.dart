class RecommendationModel {
  final String placeName;
  final String placeImage;
  final String cityName;
  final int likes;
  final int dislikes;
  final double rating;

  RecommendationModel({
    required this.placeName,
    required this.placeImage,
    required this.cityName,
    required this.likes,
    required this.dislikes,
    required this.rating,
  });

  ///will be used while parsing json response
  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      placeName: json['place_name'] as String,
      placeImage: json['image'] as String,
      cityName: json['city_name'] as String,
      likes: json['likes'] as int,
      dislikes: json['dislikes'] as int,
      rating: json['rating'] as double,
    );
  }
}
