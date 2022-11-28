import 'package:flutter/material.dart';
import 'package:shuttlers_stories/src/page_data.dart';

import 'stories_ui.dart';

class StoriesView {
  StoriesView._();

  static final StoriesView instance = StoriesView._();

  /// This method calls the UI for stories
  ///
  /// [ctx] - is a required parameter
  ///
  /// [data] - this is a list of page data. Must be 5 and should be used without pages
  ///
  /// [types] - this is a list of StoryType used to get the shareable text. This should be in order of appearance
  ///
  /// [pages] - this is the list of pages to be displayed and should be used without data
  ///
  /// [data.length == 5] ^ [pages.isNotEmpty] gives the rendering condition
  ///
  ///
  void show(
    BuildContext ctx, {
    List<PageData> data = const [],
    List<Widget> pages = const [],
    List<StoryType> types = StoryType.values,
  }) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (_) => ShutStoryView(
          pages: data,
          storyWidgets: pages,
          types: types,
        ),
      ),
    );
  }
}
