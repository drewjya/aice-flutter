import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedBody extends StatelessWidget {
  final bool isMd;
  const FeedBody({super.key}) : isMd = true;
  const FeedBody.spg({super.key}) : isMd = false;

  @override
  Widget build(BuildContext context) {
    if (isMd) {
      return Consumer(
          child: const SizedBox.shrink(),
          builder: (context, ref, child) {
            return ref.watch(salesHistoryTodayProvider).when(
              data: (data) {
                if (data.isEmpty) {
                  return child!;
                }
                return MediaQuery.removeViewPadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: data.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final curr = data[index];
                      return SalesCart(
                        onTap: () {
                          ref
                              .read(salesDetailProvider.notifier)
                              .loadDetail(curr.id);
                          Navigator.pushNamed(
                              context, SalesDetailView.routeName);
                        },
                        namaToko: curr.namaToko,
                        kodeToko: curr.kodeToko,
                        isStart: index == 0,
                        createdAt: formatDate(curr.createdAt),
                      );
                    },
                  ),
                );
              },
              error: (error) {
                return child!;
              },
              loading: () {
                return child!;
              },
            );
          });
    }
    return Container();
  }
}
