
import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';

class KeteranganAbsenWidget extends StatelessWidget {
  final String tokoAbsen;
  final String? waktuAbsen;
  const KeteranganAbsenWidget({
    Key? key,
    required this.tokoAbsen,
    required this.waktuAbsen,
  })  : isOther = false,
        super(key: key);
  final bool isOther;
  const KeteranganAbsenWidget.other({
    Key? key,
    required this.tokoAbsen,
    this.waktuAbsen,
  })  : isOther = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(isOther ? "-" : tokoAbsen),
        Text(isOther
            ? tokoAbsen
            : formatDate(waktuAbsen ?? "")),
      ],
    );
  }
}
