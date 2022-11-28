import 'package:flutter/material.dart';

class PageData {
  PageData({
    required this.title,
    this.subTitle,
    required this.imagePath,
    this.backgroundColor,
    this.duration = const Duration(seconds: 5),
    this.isShown = false,
  });

  String title;
  String? subTitle;
  String imagePath;
  Color? backgroundColor;
  Duration duration;
  bool isShown;
}

enum StoryType {
  favRoute,
  totalTrips,
  amountSaved,
  environment,
  distanceTravelled,
}

extension Copy on StoryType {
  String get copy {
    switch (this) {
      case StoryType.favRoute:
        return "Want a transport partner that will take you anywhere you need to be without stress? Use Shuttlers! Click the link to download the Shuttlers app today. https://shuttlers.page.link/app";
      case StoryType.totalTrips:
        return "Shuttlers is ready to take you places! Download the app today! https://shuttlers.page.link/app";
      case StoryType.amountSaved:
        return "Shuttlers helps me save big on transport! Join me now, download the Shuttlers app and spend less on transport. https://shuttlers.page.link/app";
      case StoryType.environment:
        return "By using Shuttlers, I’m actively doing my part in saving the earth. You should too! Download the app here; https://shuttlers.page.link/app";
      case StoryType.distanceTravelled:
        return "Want a transport partner that will take you anywhere you need to be without stress? Use Shuttlers! Click the link to download the Shuttlers app today. https://shuttlers.page.link/app";
      default:
        return "";
    }
  }
}
