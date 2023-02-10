import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedHeader extends ConsumerWidget {
  const FeedHeader({Key? key}) : super(key: key);
  const FeedHeader.spg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            ref.watch(absensiProvider).maybeWhen(
              data: (data) {
                if (data.waktuCheckIn == null) {
                  return const KeteranganAbsenWidget.other(
                      tokoAbsen: "Belum Ada Absensi");
                }
                return KeteranganAbsenWidget(
                    tokoAbsen: data.namaToko, waktuAbsen: data.waktuCheckIn);
              },
              orElse: () {
                return const KeteranganAbsenWidget.other(
                    tokoAbsen: "Belum Ada Absensi");
              },
            ),
            ElevatedButton(
              onPressed: ref.watch(absensiProvider
                      .select((value) => value.isLoading || value.hasError))
                  ? null
                  : () {
                      final absensiValue =
                          ref.watch(absensiProvider).asData?.value;
                      if (absensiValue?.waktuCheckIn != null) {
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
            ref.watch(absensiProvider).maybeWhen(
              data: (data) {
                if (data.waktuCheckIn == null) {
                  return const KeteranganAbsenWidget.other(
                      tokoAbsen: "Belum Ada Absensi");
                }
                if (data.waktuCheckOut == null) {
                  return const KeteranganAbsenWidget.other(
                      tokoAbsen: "Belum Check Out");
                }
                return KeteranganAbsenWidget(
                    tokoAbsen: data.namaToko, waktuAbsen: data.waktuCheckOut);
              },
              orElse: () {
                return const KeteranganAbsenWidget.other(
                    tokoAbsen: "Belum Ada Absensi");
              },
            ),
            ElevatedButton(
              onPressed: () {
                final absensiValue = ref.watch(absensiProvider).asData?.value;
                if (absensiValue?.waktuCheckIn == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Belum Melakukan Check In")));
                  return;
                } else if (absensiValue?.waktuCheckOut != null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
  }
}
