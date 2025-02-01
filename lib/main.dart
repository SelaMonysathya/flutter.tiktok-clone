import 'package:flutter/material.dart';
import 'package:tiktok_clone/page/feed_page.dart';
import 'package:tiktok_clone/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.black
      ),
      home: const FeedPage(),
    );
  }
}