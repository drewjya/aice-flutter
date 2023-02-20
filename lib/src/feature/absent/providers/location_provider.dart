import 'package:aice/src/core/config/config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final locationProvider = StreamProvider<Position>((ref) async* {
  await for (final message in Geolocator.getPositionStream()) {
    dPrint(message);
    yield message;
  }
});
