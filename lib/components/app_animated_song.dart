
import 'package:flutter/material.dart';

class AppAnimatedSong extends StatefulWidget {
  final String song;

  const AppAnimatedSong({
    super.key,
    required this.song,
  });

  @override
  State<AppAnimatedSong> createState() => _AppAnimatedSongState();
}

class _AppAnimatedSongState extends State<AppAnimatedSong> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
      ..forward()
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: CircleAvatar(backgroundImage: AssetImage(widget.song))
    );
  }
}