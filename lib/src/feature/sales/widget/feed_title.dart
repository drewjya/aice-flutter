import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedTitle extends StatelessWidget {
  final bool isMd;
  const FeedTitle({super.key}) : isMd = true;
  const FeedTitle.spg({super.key}) : isMd = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      if (!isMd) {
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
          child: const Padding(
            padding: EdgeInsets.only(top: 2.0, left: 12),
            child: Text(
              'Sales Today',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
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
