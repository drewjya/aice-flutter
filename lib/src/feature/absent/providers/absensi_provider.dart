import 'package:aice/src/feature/absent/model/absensi_model.dart';
import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsensiNotifier extends StateNotifier<ProviderValue<AbsensiModel>> {
  AbsensiNotifier(this.ref) : super(const ProviderValue.loading()) {
    getAbsensi();
  }
  final Ref ref;

  getAbsensi() async {
    state = const ProviderValue.loading();
    state = await ProviderValue.guard(
        () => ref.read(absentRepositoryProvider).getAbsensiToday());
  }
}

final absensiProvider =
    StateNotifierProvider<AbsensiNotifier, ProviderValue<AbsensiModel>>(
        AbsensiNotifier.new);
