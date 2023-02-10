import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final salesCurrentProvider = StateProvider<SalesHistoryModel?>((ref) {
  return null;
});

class HistoryView extends HookConsumerWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.microtask(
          () => ref.read(salesHistoryThisWeekProvider.notifier).load());
      return null;
    }, [ref.watch(authProvider)]);
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
              return ref.watch(salesHistoryThisWeekProvider).when(
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
            },
          ),
        )
      ],
    );
  }
}
