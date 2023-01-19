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
            final userName = ref.watch(userDataProvider).asData?.value ?? "";
            return CartWidget(userName: userName);
          }),
        ),
        Consumer(builder: (context, ref, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ref.watch(checkInAbsensiProvider).when(
                      data: (data) {
                        if (data == null) {
                          return const Text("Belum Ada Absensi");
                        }
                        return KeteranganAbsenWidget(
                            tokoAbsen: data.namaToko,
                            waktuAbsen: data.waktuCheckIn);
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () {
                        return const Text("Load");
                      }),
                  ElevatedButton(
                    onPressed: () {
                      if (ref.watch(checkInAbsensiProvider).asData?.value !=
                              null ||
                          ref.watch(checkInAbsensiProvider).hasError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Sudah Melakukan Check In")));
                        return;
                      }
                      Navigator.pushNamed(context, CheckInView.routeName);
                    },
                    child: const Text("Check In"),
                  ),
                ],
              ),
              const SizedBox(
                width: 32,
              ),
              Column(
                children: [
                  ref.watch(checkOutAbsensiProvider).when(
                      data: (data) {
                        if (data == null) {
                          return const Text("Belum Check Out");
                        }
                        return KeteranganAbsenWidget(
                            tokoAbsen: data.namaToko,
                            waktuAbsen: data.waktuCheckOut);
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () {
                        return const Text("Load");
                      }),
                  ElevatedButton(
                    onPressed: () {
                      if (ref.watch(checkInAbsensiProvider).asData?.value ==
                          null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Belum Melakukan Check In")));
                        return;
                      }
                      if (ref.watch(checkOutAbsensiProvider).asData?.value !=
                              null ||
                          ref.watch(checkInAbsensiProvider).hasError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Sudah Melakukan Check Out")));
                        return;
                      }
                      Navigator.pushNamed(context, CheckOutView.routeName);
                    },
                    child: const Text("Check Out"),
                  ),
                ],
              ),
            ],
          );
        }),
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
              }),
        ),
      ],
    );
  }
}
