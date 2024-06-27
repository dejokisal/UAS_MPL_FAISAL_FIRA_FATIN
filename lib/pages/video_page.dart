import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/constants/color_constants.dart';
import 'package:youtube_clone/models/video_model.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/models/comment_model.dart';

class VideoScreen extends StatefulWidget {
  final int index;
  VideoScreen({required this.index, super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState(index: index);
}

class _VideoScreenState extends State<VideoScreen> {
  int index;
  _VideoScreenState({required this.index});

  PageController controller = PageController(initialPage: 0);
  late FlickManager flickManager;
  late VideoPlayerController _controller;
  bool videoState = false; //true:pause  false:play
  bool orientation = false;

  List<Comment> comments = [
    Comment(
      profilePic: 'assets/profile_pics/1.jpg',
      username: 'User1',
      comment: 'Great video!',
      timestamp: '2 hours ago',
      likes: 12,
    ),
    Comment(
      profilePic: 'assets/profile_pics/2.jpg',
      username: 'User2',
      comment: 'Thanks for sharing.',
      timestamp: '3 hours ago',
      likes: 8,
    ),
    Comment(
      profilePic: 'assets/profile_pics/3.jpg',
      username: 'User3',
      comment: 'Very informative.',
      timestamp: '1 day ago',
      likes: 5,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(videos[index].video_url)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    flickManager = FlickManager(
      videoPlayerController: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    flickManager.dispose();
    super.dispose();
  }

  Future setLandscape() async {
    setState(() {
      orientation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 35,
            ),
            FlickVideoPlayer(flickManager: flickManager),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        videos[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ytWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Text(
                            videos[index].views,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: ytLightText,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            videos[index].upload_date,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: ytLightText,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '...more',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: ytWhite,
                                fontSize: 12,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            videos[index].channel_profile),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                videos[index].channel_name,
                                style: TextStyle(
                                    color: ytWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '9.57jt',
                                style: TextStyle(
                                    color: ytLightText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              videos[index].subscribe == "true"
                                  ? SubsTrue()
                                  : SubsFalse()
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ytVideoSecondary,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.thumb_up,
                                          color: ytWhite,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '1.2K',
                                          style: TextStyle(
                                              color: ytWhite,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 2,
                                          height: 25,
                                          color: ytHighlightColor,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.thumb_down,
                                          color: ytWhite,
                                          size: 15,
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ytVideoSecondary,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.share,
                                          color: ytWhite,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Bagikan',
                                          style: TextStyle(
                                              color: ytWhite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ytVideoSecondary,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.add,
                                          color: ytWhite,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Remix',
                                          style: TextStyle(
                                              color: ytWhite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 130,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ytVideoSecondary,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.download,
                                          color: ytWhite,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Download',
                                          style: TextStyle(
                                              color: ytWhite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 95,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ytVideoSecondary,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.library_add,
                                          color: ytWhite,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Simpan',
                                          style: TextStyle(
                                              color: ytWhite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17),
                                        ),
                                      ]),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ytVideoSecondary),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Comments',
                                    style: TextStyle(
                                        color: ytWhite,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '192',
                                    style: TextStyle(
                                        color: ytLightText,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    videos[1].channel_profile),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        videos[index].channel_name,
                                        style: TextStyle(
                                            color: ytWhite,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: ytVideoSecondary,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              color: ytWhite,
                                              size: 18,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    VideosList(index: 0),
                    VideosList(index: 1),
                    VideosList(index: 3),
                    VideosList(index: 2),
                    VideosList(index: 4),
                    VideosList(index: 5),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

class SubsTrue extends StatelessWidget {
  const SubsTrue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 32,
      decoration: BoxDecoration(
          color: ytVideoSecondary, borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.notifications_active,
            color: ytWhite,
            size: 20,
          ),
          SizedBox(
            width: 2,
          ),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: ytWhite,
          )
        ],
      ),
    );
  }
}

class SubsFalse extends StatelessWidget {
  const SubsFalse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 32,
      decoration: BoxDecoration(
          color: ytWhite, borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Subscribe',
            style: TextStyle(
                color: ytBgColor, fontSize: 15, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class VideosList extends StatelessWidget {
  final int index;
  VideosList({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.56,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(videos[index].thumbnail),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ytTimeBg,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 2, bottom: 2),
                      child: Text(
                        videos[index].duration,
                        style: TextStyle(
                            color: ytWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    )),
              ),
            )
          ]),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage(videos[index].channel_profile),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Container(
                  width: 230,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          videos[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ytWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              videos[index].channel_name +
                                  "  " +
                                  "·" +
                                  "  " +
                                  videos[index].views +
                                  "  " +
                                  "·" +
                                  "  " +
                                  videos[index].upload_date,
                              style: TextStyle(
                                  color: ytLightText, fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.more_vert,
                color: ytWhite,
              )
            ],
          ),
        )
      ],
    ));
  }
}

