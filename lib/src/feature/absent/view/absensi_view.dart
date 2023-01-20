// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/src/src.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AbsensiView extends ConsumerWidget {
  const AbsensiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Absensi',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            DateFormat('dd MMMM yyyy').format(DateTime.now()),
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(thickness: 2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ref.watch(checkInAbsensiProvider).maybeWhen(
                    data: (data) {
                      if (data == null) {
                        return const KeteranganAbsenWidget.other(
                            tokoAbsen: "Belum Ada Absensi");
                      }
                      return KeteranganAbsenWidget(
                          tokoAbsen: data.namaToko,
                          waktuAbsen: data.waktuCheckIn);
                    },
                    orElse: () {
                      return const KeteranganAbsenWidget.other(
                          tokoAbsen: "Belum Ada Absensi");
                    },
                  ),
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
                  ref.watch(checkOutAbsensiProvider).maybeWhen(
                    data: (data) {
                      if (data == null) {
                        return const KeteranganAbsenWidget.other(
                            tokoAbsen: "Belum Check Out");
                      }
                      return KeteranganAbsenWidget(
                          tokoAbsen: data.namaToko,
                          waktuAbsen: data.waktuCheckOut);
                    },
                    orElse: () {
                      return const KeteranganAbsenWidget.other(
                          tokoAbsen: "Belum Ada Absensi");
                    },
                  ),
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
          ),
        ],
      ),
    );
  }
}

class KeteranganAbsenWidget extends StatelessWidget {
  final String tokoAbsen;
  final Timestamp? waktuAbsen;
  const KeteranganAbsenWidget({
    Key? key,
    required this.tokoAbsen,
    required this.waktuAbsen,
  })  : isOther = false,
        super(key: key);
  final bool isOther;
  const KeteranganAbsenWidget.other({
    Key? key,
    required this.tokoAbsen,
    this.waktuAbsen,
  })  : isOther = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(isOther ? "-" : tokoAbsen),
        Text(isOther
            ? tokoAbsen
            : DateFormat("dd-MM-yyyy / HH:mm").format(waktuAbsen!.toDate())),
      ],
    );
  }
}
