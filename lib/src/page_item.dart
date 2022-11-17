import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:screenshot/screenshot.dart';

class PageItem implements StoryItem {
  PageItem({
    required this.context,
    required this.screenshotController,
    required this.body,
    this.displayDuration = const Duration(seconds: 3),
    this.isShown = false,
  });
  BuildContext context;
  Widget body;
  Duration displayDuration;
  bool isShown;
  ScreenshotController screenshotController;

  @override
  bool shown = false;

  @override
  Duration get duration => displayDuration;

  @override
  Widget get view => Screenshot(
        controller: screenshotController,
        child: body,
      );
}
