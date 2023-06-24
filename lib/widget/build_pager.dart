import 'package:flutter/material.dart';

class BuildPager extends StatelessWidget {
  const BuildPager({
    super.key,
    required this.imageHeight,
    required this.responsiveWelcomeFontSize,
    required this.responsiveFontSize,
    required this.imageAsset,
    required this.title,
    required this.subTitle,
  });

  final double imageHeight;
  final double responsiveWelcomeFontSize;
  final double responsiveFontSize;
  final String imageAsset;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imageAsset,
            height: imageHeight,
          ),
          Text(
           title,
            style: TextStyle(
                fontSize: responsiveWelcomeFontSize,
                decoration: TextDecoration.none,
                color: const Color(0xFF1BAC4B)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subTitle,
            style: TextStyle(
                fontSize: responsiveFontSize,
                decoration: TextDecoration.none,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
