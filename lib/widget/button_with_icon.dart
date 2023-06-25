import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.backgroundColor,
    required this.imageAsset,
    required this.btnText,
  });

  final Color backgroundColor;
  final String imageAsset;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Raza colțurilor butonului
        ),
        side: BorderSide(
          color: Colors.grey, // Culoarea marginilor
          width: 1, // Grosimea marginilor
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageAsset),
            SizedBox(
              width: 10,
            ),
            Text(
              btnText,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
