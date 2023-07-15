import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.backgroundColor,
    required this.imageAsset,
    this.btnText = "",
    this.sizedBox = 10,
    this.width = 15,
    this.height = 25,
    required this.onClick,
  });

  final Color backgroundColor;
  final String imageAsset;
  final String btnText;
  final double sizedBox;
  final double width;
  final double height;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Raza colțurilor butonului
        ),
        side: const BorderSide(
          color: Colors.grey, // Culoarea marginilor
          width: 1, // Grosimea marginilor
        ),
      ),
      onPressed: () {
        onClick();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: width, horizontal: height),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(imageAsset),
            ),
            SizedBox(
              width: sizedBox,
            ),
            Text(
              btnText,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
