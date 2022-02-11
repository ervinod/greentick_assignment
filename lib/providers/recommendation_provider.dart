import 'package:flutter/cupertino.dart';
import 'package:greentick_assignment/models/recommendation_model.dart';

class RecommendationProvider extends ChangeNotifier {
  List<RecommendationModel> recommendationList = [
    RecommendationModel(
        placeName: "Markiza Spa",
        placeImage: "https://www.joile.in/upload/KohinoorBanner4.jpg",
        cityName: "Sports City",
        likes: 1300,
        dislikes: 103,
        rating: 4.3),
    RecommendationModel(
        placeName: "Rixos Premium Resort",
        placeImage:
            "https://renaissancecollege.edu/wp-content/uploads/2017/03/Advanced-Massage-Certification-In-Utah.jpg",
        cityName: "Sports City",
        likes: 10000,
        dislikes: 764,
        rating: 4.3),
    RecommendationModel(
        placeName: "Cricket Academy",
        placeImage: "https://www.joile.in/upload/KohinoorBanner4.jpg",
        cityName: "Sports City",
        likes: 400,
        dislikes: 10,
        rating: 4.3),
    RecommendationModel(
        placeName: "Greentick Solutions",
        placeImage:
            "https://renaissancecollege.edu/wp-content/uploads/2017/03/Advanced-Massage-Certification-In-Utah.jpg",
        cityName: "Sports City",
        likes: 4000,
        dislikes: 456,
        rating: 4.3),
    RecommendationModel(
        placeName: "Markiza Spa",
        placeImage: "https://www.joile.in/upload/KohinoorBanner4.jpg",
        cityName: "Sports City",
        likes: 1300,
        dislikes: 103,
        rating: 4.3),
    RecommendationModel(
        placeName: "Markiza Spa",
        placeImage:
            "https://renaissancecollege.edu/wp-content/uploads/2017/03/Advanced-Massage-Certification-In-Utah.jpg",
        cityName: "Sports City",
        likes: 1300,
        dislikes: 103,
        rating: 4.3),
  ];
}
