import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 5.height(context),
          ),
          width: 100.width(context),
          child: Consumer(builder: (context, ref, child) {
            final auth = ref.watch(authProvider).asData?.value;
            if (auth == null) {
              return const SizedBox.shrink();
            }
            return CartWidget(auth: auth);
          }),
        ),
        Consumer(builder: (context, ref, child) {
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
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 9),
                  ),
                ),
              ],
            ),
          );
        }),
        Expanded(
          child: Consumer(
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
                                  .read(salesCurrentProvider.notifier)
                                  .update((state) => curr);
                              Navigator.pushNamed(
                                  context, SalesDetailView.routeName);
                            },
                            namaToko: curr.namaToko,
                            kodeToko: curr.kodeToko,
                            isStart: index == 0,
                            createdAt: curr.createdAt,
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
              }),
        ),
      ],
    );
  }
}
