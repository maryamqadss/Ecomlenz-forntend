import 'package:flutter/material.dart';
import '../../../style/style.dart';


class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;

  const AuthHeader({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.sizeOf(context).height > 630 ? 180 : 160,
      decoration: BoxDecoration(
        color: primary_Color,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(140),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white, fontSize: 34, letterSpacing: 2),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1.0),
              // Adjust the value as needed
              child: Text(
                subTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
