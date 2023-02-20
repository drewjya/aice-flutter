// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GradientBorderPainter extends CustomPainter {
  final List<Color> color;

  final double strokeWidth;

  GradientBorderPainter({required this.color, this.strokeWidth = 4.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: color,
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ContainerGradientBorder extends StatelessWidget {
  final List<Color> color;
  final Widget? child;
  final double strokeWidth;
  const ContainerGradientBorder({
    Key? key,
    required this.color,
    this.child,
    this.strokeWidth = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(color: color, strokeWidth: strokeWidth),
      child: child,
    );
  }
}

class FeedTitle extends StatelessWidget {
  final bool isMd;
  const FeedTitle({super.key}) : isMd = true;
  const FeedTitle.spg({super.key}) : isMd = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      if (!isMd) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: ContainerGradientBorder(
            strokeWidth: 2,
            color: const [
              Color.fromRGBO(255, 111, 145, 1),
              Color.fromRGBO(255, 150, 113, 1)
            ],
            child: Container(
              color: Colors.white,
              width: 120,
              margin: const EdgeInsets.only(bottom: 1, top: 0.0001),
              child: const Center(
                child: Text(
                  'Absensi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
            ),
          ),
        );
      }
      final data = ref.watch(salesHistoryTodayProvider).asData?.value ?? [];
      return Container(
        margin: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 8,
        ),
        padding: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.blueGrey.shade300,
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 2.0, left: 12),
              child: Text(
                'Sales Today',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 12),
              child: Text(
                "${data.length} / 20",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
              ),
            ),
          ],
        ),
      );
    });
  }
}
