import 'dart:io';

import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsensiNotifier extends StateNotifier<ProviderValue<AbsensiModel>> {
  AbsensiNotifier(this.ref) : super(const ProviderValue.loading()) {
    getAbsensi();
  }
  final Ref ref;

  getAbsensi() async {
    dPrint("INI ABSENSI");
    state = const ProviderValue.loading();
    state = await ProviderValue.guard(
        () => ref.read(absentRepositoryProvider).getAbsensiToday());
    dPrint(state);
  }

  setState(ProviderValue<AbsensiModel> newState) {
    state = const ProviderValue.loading();
    state = newState;
  }
}

class InputAbsensiNotifier extends StateNotifier<ProviderValue<void>> {
  InputAbsensiNotifier(this.ref)
      : super(ProviderValue.error(
            ErrorValue(status: ApiFailure.init, message: "")));
  final Ref ref;

  checkIn(CheckInModel checkInModel, File fotoSelfie) async {
    state = const ProviderValue.loading();
    final data = await ProviderValue.guard(() =>
        ref.read(absentRepositoryProvider).checkIn(checkInModel: checkInModel));
    if (data.asData?.value != null) {
      await ref.read(absensiProvider.notifier).getAbsensi();
      final data = ref.read(absensiProvider).asData?.value;
      await ref.read(absentRepositoryProvider).postGambar(
          fotoDto: FotoDto(keteranganFoto: "fotoSelfie", foto: fotoSelfie),
          absensiId: data!.id);
      ref.read(absensiProvider.notifier).getAbsensi();
    }
    state = data;
  }

  checkkOut(
      CheckOutModel checkOutModel, List<FotoDto> fotos, int absensiId) async {
    state = const ProviderValue.loading();
    final data = await ProviderValue.guard(() =>
        ref.read(absentRepositoryProvider).checkOut(absensiId: absensiId));
    if (data.hasError) {
      state = data;
      return;
    }

    await ProviderValue.guard(() => ref
        .read(absentRepositoryProvider)
        .postFormAbsensi(checkOutModel: checkOutModel));
    for (var element in fotos) {
      await sendFoto(fotoDto: element, id: absensiId);
    }
    ref.read(absensiProvider.notifier).getAbsensi();
    state = data;
  }

  Future<ProviderValue> sendFoto(
      {required FotoDto fotoDto, required int id}) async {
    final val = await ProviderValue.guard(() => ref
        .read(absentRepositoryProvider)
        .postGambar(fotoDto: fotoDto, absensiId: id));
    return val;
  }

  sendProdukList({
    required List<ProdukReportModel> produkReportModel,
    required int formAbsensiId,
    required int absensiSpgId,
  }) async {
    state = const ProviderValue.loading();
    final val = await ProviderValue.guard(() => ref
        .read(absentRepositoryProvider)
        .postProdukPenjualan(
            absensiSpgId: absensiSpgId,
            produkPenjualan: produkReportModel,
            formAbsensiId: formAbsensiId));
    if (val.hasError) {
      state = val;
      return;
    }
    ref.invalidate(listProdukReportProvider);
    ref.read(absensiDetailProvider.notifier).loadData();
    state = val;
  }
}

final absensiProvider = StateNotifierProvider.autoDispose<AbsensiNotifier,
    ProviderValue<AbsensiModel>>(
  (ref) {
    return AbsensiNotifier(ref);
  },
);

final inputAbsensiProvider =
    StateNotifierProvider<InputAbsensiNotifier, ProviderValue>((ref) {
  ref.watch(authProvider);
  return InputAbsensiNotifier(ref);
});
