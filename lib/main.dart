import 'package:flutter/material.dart';
import 'package:nasa/constants/colors.dart';
import 'package:nasa/constants/theme.dart';
import 'package:nasa/screens/Home_page/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA Abbreviation',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomePage(),
      color: AppColors.color,
    );
  }
}
