import 'package:flutter/material.dart';

class ImageAbsen extends StatelessWidget {
  const ImageAbsen({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
