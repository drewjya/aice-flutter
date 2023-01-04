import 'package:flutter/material.dart';

class DetailText extends StatelessWidget {
  const DetailText({
    super.key,
    required this.param,
    required this.value,
  });
  final String param;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
              child: Text(
            param,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )),
          const Text(":  "),
          Expanded(
              child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
            ),
          )),
        ],
      ),
    );
  }
}
