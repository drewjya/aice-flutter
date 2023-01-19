import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';

class ImageSalesWidget extends StatelessWidget {
  const ImageSalesWidget({
    super.key,
    required this.url,
    required this.title,
  });
  final String url;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Center(
            child: Image.network(
              url,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 100.width(context),
              height: 20,
              color: Colors.white,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
