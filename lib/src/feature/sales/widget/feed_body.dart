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
    return Consumer(
      builder: (context, ref, child) {
        return ref.watch(absensiProvider).maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          data: (data) {
            final status =
                data.waktuCheckIn != null && data.waktuCheckOut != null;
            if (data.namaToko.isEmpty) {
              return const SizedBox.shrink();
            }
            return InkWell(
              onTap: !status
                  ? null
                  : () {
                      Navigator.pushNamed(context, AbsensiDetailView.routeName);
                    },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                    color: !status
                        ? const Color.fromARGB(255, 232, 232, 232)
                        : null,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 37,
                          ),
                          Container(
                            width: 102,
                            height: 110,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  ApiUrl.getImage(
                                          data.fotoAbsensi?.isEmpty ?? true
                                              ? null
                                              : data.fotoAbsensi) ??
                                      "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 37,
                          ),
                          Flexible(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Text(
                                    data.namaToko,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Text(
                                    PilihanToko.values
                                        .firstWhere((element) =>
                                            element.value == data.pilihanTokoId)
                                        .name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Text(
                                    status ? "Sudah Absen" : "Belum Absen",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            data.statusListProduk ? Icons.check : Icons.close,
                            color: data.statusListProduk
                                ? Colors.green
                                : Colors.red,
                          ),
                          const Text(
                            "Produk Penjualan",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
