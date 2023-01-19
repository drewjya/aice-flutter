// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aice/src/src.dart';
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
      body: Row(
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
                  if (ref.watch(checkInAbsensiProvider).asData?.value != null ||
                      ref.watch(checkInAbsensiProvider).hasError) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                  if (ref.watch(checkInAbsensiProvider).asData?.value == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Belum Melakukan Check In")));
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
    );
  }
}

class KeteranganAbsenWidget extends StatelessWidget {
  final String tokoAbsen;
  final Timestamp waktuAbsen;
  const KeteranganAbsenWidget({
    Key? key,
    required this.tokoAbsen,
    required this.waktuAbsen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(tokoAbsen),
        Text(DateFormat("dd-MM-yyyy / HH:mm").format(waktuAbsen.toDate())),
      ],
    );
  }
}
