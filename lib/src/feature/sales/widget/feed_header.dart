// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsensiButton extends StatelessWidget {
  final String tanggal;
  final Widget child;
  final VoidCallback? onPressed;
  const AbsensiButton({
    Key? key,
    required this.tanggal,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          tanggal,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff828282),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            foregroundColor:
                onPressed == null ? const Color(0xFF828282) : Colors.white,
          ),
          child: child,
        )
      ],
    );
  }
}

class FeedHeader extends ConsumerWidget {
  const FeedHeader({Key? key}) : super(key: key);
  const FeedHeader.spg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final absensi = ref.watch(absensiProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AbsensiButton(
            tanggal: absensi.asData?.value != null
                ? formatDate2(absensi.asData!.value.waktuCheckIn)
                : "-",
            onPressed: absensi.isLoading ||
                    absensi.hasError ||
                    absensi.asData?.value.waktuCheckIn != null
                ? null
                : () async {
                    final location = await Geolocator.checkPermission();
                    dPrint(location);
                    if (!(location == LocationPermission.whileInUse ||
                        location == LocationPermission.always)) {
                      final data = await Geolocator.requestPermission();
                      dPrint(data);
                      return;
                    }
                    final type = await Geolocator.getLocationAccuracy();
                    dPrint(type);
                    if (context.mounted) {
                      Navigator.pushNamed(context, CheckInView.routeName);
                    }
                  },
            child: const Text(
              "Check In",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          AbsensiButton(
            tanggal: absensi.asData?.value != null
                ? (absensi.asData!.value.waktuCheckIn != null &&
                        absensi.asData!.value.waktuCheckOut == null)
                    ? "\n-"
                    : formatDate2(absensi.asData!.value.waktuCheckOut)
                : "-",
            onPressed: (absensi.isLoading ||
                    absensi.hasError ||
                    absensi.asData?.value.waktuCheckIn == null ||
                    absensi.asData?.value.waktuCheckOut != null)
                ? null
                : () => Navigator.pushNamed(context, CheckOutView.routeName),
            child: const Text(
              "Check Out",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
