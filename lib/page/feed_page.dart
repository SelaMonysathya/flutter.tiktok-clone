import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/data/data/feed_data.dart';
import 'package:tiktok_clone/theme/app_colors.dart';

import '../components/app_video_card.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: feedData.length,
            itemBuilder: (_, index) {
              return AppVideoCard(item: feedData[index]);
            }
          ),
          Positioned.fill(
            top: 0,
            child: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {}, 
                    icon: SvgPicture.asset("assets/icons/live.svg")
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {}, 
                          child: Text("Following", style: TextStyle(color: AppColors.white)),
                        ),
                        Gap(8),
                        TextButton(
                          onPressed: () {}, 
                          child: Text("For you", style: TextStyle(color: AppColors.white)),
                        ),
                      ],
                    )
                  ),
                  IconButton(
                    onPressed: () {}, 
                    icon: SvgPicture.asset("assets/icons/search.svg")
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
