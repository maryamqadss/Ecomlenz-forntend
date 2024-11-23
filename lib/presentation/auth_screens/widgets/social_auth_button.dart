import 'package:flutter/material.dart';
import '../../../style/style.dart';

class SocialAuthBtn extends StatelessWidget {
  final String imagePath; // To accept the path of the image
  final String label; // To accept the text label

  const SocialAuthBtn({
    super.key,
    required this.imagePath, // Required image path
    required this.label, // Required label text
  });

  @override
  Widget build(BuildContext context) {
    // Get 35% of the screen width
    double buttonWidth = MediaQuery.of(context).size.width * 0.40;

    return Container(
      width: buttonWidth, // Set the width to 35% of the screen
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade100,
          padding: EdgeInsets.symmetric(
              vertical: 12, horizontal: 16), // Adjust padding as needed
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // To make the button fit the content
          children: [
            Image.asset(
              imagePath, // Use the image path passed from the parent
              height: 24, // Adjust the size of the image
              width: 24,
            ),
            SizedBox(width: 8), // Add spacing between the image and text
            Text(
              label, // Use the label passed from the parent
              style: TextStyle(
                color: primary_Color, // Text color
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
