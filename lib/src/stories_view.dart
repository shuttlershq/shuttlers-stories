import 'package:flutter/material.dart';
import 'package:shuttlers_stories/src/page_data.dart';

import 'stories_ui.dart';

class StoriesView {
  StoriesView._();

  static final StoriesView instance = StoriesView._();

  /// This method calls the UI for rating drivers
  ///
  /// * [BuildContext] - is a required parameter
  ///
  /// * [driverName] - this takes in the name of the driver and it is required
  ///
  /// * [routeCode] - this is the route code and this is required
  ///
  /// * [image] - this is the image of the driver and it is optional
  ///
  /// * [vehicleType] - this is the vehicle type is is required
  ///
  /// * [plateNumber] - this is the plate number of the vehicle and it is required
  ///
  ///
  void show(
    BuildContext ctx, {
    List<PageData> data = const [],
  }) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (_) => ShutStoryView(pages: data),
      ),
    );
  }
}
