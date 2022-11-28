import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:story_view/story_view.dart' hide PageData;

import 'page_data.dart';
import 'page_item.dart';
import 'package:path_provider/path_provider.dart';

class ShutStoryView extends StatefulWidget {
  ShutStoryView(
      {Key? key,
      required this.pages,
      required this.types,
      this.storyWidgets = const []})
      : assert((pages.length == 5) ^ storyWidgets.isNotEmpty),
        assert(storyWidgets.length == types.length),
        super(key: key);

  final List<PageData> pages;
  final List<Widget> storyWidgets;
  final List<StoryType> types;

  @override
  State<ShutStoryView> createState() => _ShutStoryViewState();
}

class _ShutStoryViewState extends State<ShutStoryView> {
  late ScreenshotController captureController;
  late StoryController newController;
  int _page = 0;

  @override
  void initState() {
    newController = StoryController();
    captureController = ScreenshotController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
            controller: newController,
            storyItems: [
              if (widget.storyWidgets.isNotEmpty)
                ...widget.storyWidgets
                    .map(
                      (e) => PageItem(
                          key: Key(widget.storyWidgets.indexOf(e).toString()),
                          context: context,
                          screenshotController: captureController,
                          body: e),
                    )
                    .toList(),
              if (widget.pages.length == 5) ...[
                PageItem(
                  key: const Key("1"),
                  context: context,
                  screenshotController: captureController,
                  // TODO: STANDARDIZE BODY OF PAGE ITEM TO CUSTOM WIDGETS LEVERAGING PASSED IN PAGE DATA
                  body: Container(
                    color: const Color(0xFFFF94E6),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: 'You travelled a total of',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' 1000Km',
                                            style: TextStyle(
                                                color: Colors.blue[700],
                                                fontSize: 40,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const TextSpan(
                                            text: ' this year',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 40,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ]),
                                  ),
                                  const SizedBox(height: 51),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Oshey',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Mr Ajala',
                                        style: TextStyle(
                                            color: Colors.blue[700],
                                            fontSize: 32,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 65 *
                                    MediaQuery.of(context).size.width /
                                    414),
                            child: Image(
                              image: const AssetImage("assets/1.png"),
                              height: 233 *
                                  MediaQuery.of(context).size.height /
                                  896,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                PageItem(
                  key: const Key("2"),
                  context: context,
                  screenshotController: captureController,
                  // TODO: STANDARDIZE BODY OF PAGE ITEM TO CUSTOM WIDGETS LEVERAGING PASSED IN PAGE DATA
                  body: Container(
                    color: const Color(0xFFFF94E6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                    text: 'You completed a total of',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' 100 trips',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                  height: 69 *
                                      MediaQuery.of(context).size.height /
                                      896),
                              Center(
                                child: Image(
                                  image: const AssetImage("assets/2.png"),
                                  height: 340 *
                                      MediaQuery.of(context).size.height /
                                      896,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PageItem(
                  key: const Key("3"),
                  context: context,
                  screenshotController: captureController,
                  // TODO: STANDARDIZE BODY OF PAGE ITEM TO CUSTOM WIDGETS LEVERAGING PASSED IN PAGE DATA
                  body: Container(
                    color: const Color(0xFFFF94E6),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 160 *
                                          MediaQuery.of(context).size.height /
                                          896),
                                  RichText(
                                    text: const TextSpan(
                                        text: 'You saved a total of',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' ₦100,000',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 40,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 41 *
                                    MediaQuery.of(context).size.height /
                                    896,
                                left: 65 *
                                    MediaQuery.of(context).size.width /
                                    414),
                            child: Image(
                              image: const AssetImage("assets/3.png"),
                              height: 364 *
                                  MediaQuery.of(context).size.height /
                                  896,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                PageItem(
                  key: const Key("4"),
                  context: context,
                  screenshotController: captureController,
                  // TODO: STANDARDIZE BODY OF PAGE ITEM TO CUSTOM WIDGETS LEVERAGING PASSED IN PAGE DATA
                  body: Container(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'You saved a total of 600kg of CO2',
                                style: TextStyle(
                                    color: Color(0xFF20E682),
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                  height: 51 *
                                      MediaQuery.of(context).size.height /
                                      896),
                              const Text(
                                'Technically',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                'You planted 5 trees',
                                style: TextStyle(
                                    color: Color(0xFF20E682),
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height:
                                211 * MediaQuery.of(context).size.height / 896),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 38),
                          child: Image(
                            image: const AssetImage("assets/4.png"),
                            height:
                                112 * MediaQuery.of(context).size.height / 896,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                PageItem(
                  key: const Key("5"),
                  context: context,
                  screenshotController: captureController,
                  // TODO: STANDARDIZE BODY OF PAGE ITEM TO CUSTOM WIDGETS LEVERAGING PASSED IN PAGE DATA
                  body: Container(
                    color: const Color(0xFFFF94E6),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: const [
                                      Text(
                                        'Your fave route was',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'Omilani - Ikate',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 51),
                                  const Text(
                                    'What’s so special about these two locations ehn?',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 48 *
                                    MediaQuery.of(context).size.height /
                                    896),
                            Image(
                              image: const AssetImage("assets/5.png"),
                              height: 256 *
                                  MediaQuery.of(context).size.height /
                                  896,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            ],
            onStoryShow: (s) {
              String key = s.view.key.toString();
              _page = int.parse(
                  key.substring(key.indexOf("'") + 1, key.lastIndexOf("'")));
              // setState(() {});
            },
            onComplete: () {},
            progressPosition: ProgressPosition.top,
            repeat: true,
            inline: true,
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                top: 18,
                left: 16,
                right: 16,
              ),
              child: ProfileTile(
                onShareTap: () {
                  newController.pause();
                  captureController.capture().then((value) async {
                    await saveAndShare(value!, widget.types.elementAt(_page));
                  });
                },
                onCloseTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveAndShare(Uint8List bytes, StoryType type) async {
    final dir = await getApplicationDocumentsDirectory();
    final image = File('${dir.path}/shuttlers.png');
    image.writeAsBytes(bytes);

    await Share.shareFiles([image.path], text: type.copy);
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    this.onShareTap,
    this.onCloseTap,
  }) : super(key: key);

  final void Function()? onShareTap;
  final void Function()? onCloseTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFF000000),
          radius: 24,
          child: Image(fit: BoxFit.cover, image: AssetImage("assets/shut.png")),
        ),
        Row(
          children: [
            IconButton(
              onPressed: onShareTap,
              icon: const Icon(
                Icons.ios_share_rounded,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: onCloseTap,
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
