import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/constants/color_constants.dart';
import '../models/shorts_model.dart';

class ShortsPage extends StatefulWidget {
  const ShortsPage({super.key});

  @override
  State<ShortsPage> createState() => _ShortsPageState();
}

class _ShortsPageState extends State<ShortsPage> {
  PageController controller = PageController(initialPage: 0);
  late FlickManager flickManager;
  late VideoPlayerController _controller;
  late bool videoState = false; //true:pause  false:play

  @override
  void initState() {
    // TODO: implement initState

    _controller = VideoPlayerController.asset(shorts[0].video_url);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: [
          PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: shorts.length,
              controller: controller,
              onPageChanged: (index) {
                _controller =
                    VideoPlayerController.asset(shorts[index].video_url);

                _controller.addListener(() {
                  setState(() {});
                });
                _controller.setLooping(true);
                _controller.initialize().then((_) => setState(() {}));
                _controller.play();
              },
              itemBuilder: (context, index) {
                return Container(
                  child: Stack(children: [
                    GestureDetector(
                      onTap: () {
                        if (videoState) {
                          _controller.play();
                          videoState = false;
                        } else {
                          _controller.pause();
                          videoState = true;
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 6,
                        child: VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                              playedColor: ytWhite,
                              bufferedColor: Colors.white.withOpacity(0),
                              backgroundColor: Colors.white.withOpacity(0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20, left: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 280,
                                child: Text(
                                  shorts[index].title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: ytWhite),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          image: DecorationImage(
                                              image: AssetImage(shorts[index]
                                                  .channel_profile))),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      shorts[index].channel_name,
                                      style: TextStyle(
                                          color: ytWhite,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ytRed,
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          'SUBSCRIBE',
                                          style: TextStyle(
                                              color: ytWhite,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )
                                  ]),
                            ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20, right: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.thumb_up,
                                        size: 25,
                                        color: ytWhite,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        shorts[index].likes,
                                        style: TextStyle(
                                            color: ytWhite,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 22,
                                      ),
                                      Icon(
                                        Icons.thumb_down,
                                        size: 25,
                                        color: ytWhite,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        shorts[index].dislikes,
                                        style: TextStyle(
                                            color: ytWhite,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.comment,
                                        size: 25,
                                        color: ytWhite,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        shorts[index].comment_count,
                                        style: TextStyle(
                                            color: ytWhite,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Icon(
                                    Icons.share,
                                    size: 25,
                                    color: ytWhite,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Bagikan',
                                    style: TextStyle(
                                        color: ytWhite,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.more_horiz,
                                    size: 40,
                                    color: ytWhite,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            shorts[index].channel_profile))),
                              ),
                            ]),
                      ),
                    ),
                    videoState ? PauseButton() : PlayButton()
                  ]),
                );
              }),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Icon(
                  Icons.search,
                  size: 30,
                  color: ytWhite,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                  color: ytWhite,
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

class PauseButton extends StatelessWidget {
  const PauseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black.withOpacity(0.5),
        ),
        child: Icon(
          Icons.pause,
          color: ytWhite,
          size: 30,
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(),
    );
  }
}