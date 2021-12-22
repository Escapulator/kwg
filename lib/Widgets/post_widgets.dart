import 'package:flutter/material.dart';
import 'package:kwgg/Constants/app_colors.dart';

class PostWidget extends StatelessWidget {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  final double height;
  const PostWidget(
      {Key? key,
      required this.body,
      required this.email,
      required this.id,
      required this.name,
      required this.height,
      required this.postId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        height: height * .25,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              email,
              style: const TextStyle(
                  color: AppColors.gray,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              body,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
