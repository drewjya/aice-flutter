import 'package:aice/src/feature/absent/widget/image_absensi_widget.dart';
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
            if (data.namaToko.isEmpty) {
              return const SizedBox.shrink();
            }
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("TOKO: ${data.namaToko}"),
                  Text(
                      "JENIS TOKO:${PilihanToko.values.firstWhere((element) => element.value == data.pilihanTokoId).name}"),
                  Text(
                      "Waktu Check In: ${data.waktuCheckIn != null ? formatDate(data.waktuCheckIn!) : "Belum Check In"}"),
                  Text(
                      "Waktu Check Out: ${data.waktuCheckOut != null ? formatDate(data.waktuCheckOut!) : "Belum Check Out"}"),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      ref.read(absentRepositoryProvider).getAbsensiDetail();
                    },
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: ImageAbsen(
                        url: ApiUrl.getImage(data.fotoAbsensi?.isEmpty ?? true
                                ? null
                                : data.fotoAbsensi) ??
                            "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
