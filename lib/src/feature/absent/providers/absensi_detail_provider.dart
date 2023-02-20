import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsensiDetailNotifier
    extends StateNotifier<ProviderValue<AbsensiDetailModel>> {
  AbsensiDetailNotifier(this.ref) : super(const ProviderValue.loading()) {
    loadData();
  }
  final Ref ref;
  loadData() async {
    final id = ref.read(absensiProvider).asData?.value.formAbsensiId;
    state = const ProviderValue.loading();
    state = await ProviderValue.guard(
        () => ref.read(absentRepositoryProvider).getAbsensiDetail(id ?? 0));
  }
}

final absensiDetailProvider = StateNotifierProvider.autoDispose<
    AbsensiDetailNotifier, ProviderValue<AbsensiDetailModel>>((ref) {
  ref.watch(absensiProvider);
  return AbsensiDetailNotifier(ref);
});
