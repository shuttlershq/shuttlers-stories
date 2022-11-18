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
