import 'package:aice/src/core/config/date_config.dart';
import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 20),
          child: Text(
            '1 Minggu Terakhir',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
        Expanded(
          child: Consumer(
            child: const SizedBox.shrink(),
            builder: (context, ref, child) {
              return ref.watch(salesHistoryLastWeekProvider).when(
                data: (data) {
                  dPrint(data.length);
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
                            Navigator.pushNamed(
                                context, SalesDetailView.routeName);
                          },
                          namaToko: curr.namaToko,
                          kodeToko: curr.kodeToko,
                          isStart: index == 0,
                          createdAt: formatDate(curr.tanggal),
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return child!;
                },
                loading: () {
                  return child!;
                },
              );
            },
          ),
        )
      ],
    );
  }
}
