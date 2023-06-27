import 'package:flutter/material.dart';
import 'package:food_flutter/screens/start_login_screen.dart';
import 'package:food_flutter/widget/build_pager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalktroughScreen extends StatefulWidget {
  const WalktroughScreen({super.key});

  @override
  State<WalktroughScreen> createState() => _WalktroughScreenState();
}

class _WalktroughScreenState extends State<WalktroughScreen> {
  final _controller = PageController();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // Calculăm dimensiunea fontului în funcție de lățimea ecranului
    var welcomeFontSize = 40;
    var textFontSize = 18;
    var imageHeight = 0.0;
    double responsiveWelcomeFontSize = 0.0;
    double responsiveFontSize = 0.0;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      setState(() {
        responsiveWelcomeFontSize = welcomeFontSize * screenWidth / 500.0;
        responsiveFontSize = textFontSize * screenWidth / 500.0;
        imageHeight = MediaQuery.of(context).size.height * 0.6;
      });
    } else {
      setState(() {
        responsiveWelcomeFontSize = welcomeFontSize * screenHeight / 375.0;
        responsiveFontSize = textFontSize * screenHeight / 375.0;
        imageHeight = MediaQuery.of(context).size.height * 0.3;
      });
    }
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (pag) {
                  setState(() {
                    page = pag;
                  });
                },
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  BuildPager(
                    imageHeight: imageHeight,
                    responsiveWelcomeFontSize: responsiveWelcomeFontSize,
                    responsiveFontSize: responsiveFontSize,
                    imageAsset: 'assets/walktrough1.png',
                    title: 'Order for Food',
                    subTitle:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  ),
                  BuildPager(
                    imageHeight: imageHeight,
                    responsiveWelcomeFontSize: responsiveWelcomeFontSize,
                    responsiveFontSize: responsiveFontSize,
                    imageAsset: 'assets/walktrough2.png',
                    title: 'Easy Payment',
                    subTitle:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  ),
                  BuildPager(
                    imageHeight: imageHeight,
                    responsiveWelcomeFontSize: responsiveWelcomeFontSize,
                    responsiveFontSize: responsiveFontSize,
                    imageAsset: 'assets/walktrough3.png',
                    title: 'Fast Delivery',
                    subTitle:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  ),
                ],
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xFF1BAC4B),
                    dotWidth: 7.0,
                    dotHeight: 7.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1BAC4B)),
                onPressed: () {
                  if (_controller.page! < 2) {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  }else{
                    Navigator.pushReplacementNamed(context, '/start-login');
                  }
                },
                child: Text(
                  page < 2 ? "Next" : "Get Started",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
