
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/data/models/feed.dart';
import 'package:video_player/video_player.dart';

import '../theme/app_colors.dart';
import 'app_animated_song.dart';

class AppVideoCard extends StatefulWidget {
  final Feed item;
  
  const AppVideoCard({
    super.key, required this.item,
  });

  @override
  State<AppVideoCard> createState() => _AppVideoCardState();
}

class _AppVideoCardState extends State<AppVideoCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.item.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
    super.initState();
  }

  BoxFit _checkVideoRatio(double height, double width) {
    if (width > height) {
      return BoxFit.contain;
    }
    return BoxFit.cover;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FittedBox(
          fit: _checkVideoRatio(_controller.value.size.height, _controller.value.size.width),
          child: SizedBox(
            height: _controller.value.size.height,
            width: _controller.value.size.width,
            child: VideoPlayer(_controller),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black.withOpacity(0.1),
                AppColors.black.withOpacity(0.2),
              ]
            )
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.item.title,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Gap(8),
                        Text(
                          widget.item.description,
                          style: TextStyle(color: AppColors.white),
                        ),
                        Gap(8),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/song.svg"),
                            Gap(4),
                            Text(
                              widget.item.song,
                              style: TextStyle(color: AppColors.white),
                            )
                          ],
                        )
                      ],
                    )
                  ),
                  Gap(8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(backgroundImage: AssetImage(widget.item.profileUrl)),
                      Gap(16),
                      Column(
                        children: [
                          SvgPicture.asset("assets/icons/heart.svg"),
                          Text(
                            widget.item.like,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                      Gap(16),
                      Column(
                        children: [
                          SvgPicture.asset("assets/icons/comment.svg"),
                          Text(
                            widget.item.comment,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                      Gap(16),
                      Column(
                        children: [
                          SvgPicture.asset("assets/icons/bookmark.svg"),
                          Text(
                            widget.item.bookmark,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                      Gap(16),
                      Column(
                        children: [
                          SvgPicture.asset("assets/icons/share.svg"),
                          Text(
                            widget.item.share,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                      Gap(16),
                      AppAnimatedSong(song: widget.item.songUrl)
                    ],
                  )
                ],
              ),
            ),
          )
        )
      ],
    );
  }
}