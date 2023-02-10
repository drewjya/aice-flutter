import 'package:aice/src/feature/sales/model/foto_sales_dto.dart';
import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SalesFormNotifier extends StateNotifier<ProviderValue<SalesDetail>> {
  SalesFormNotifier(this.ref)
      : super(ProviderValue.error(
            ErrorValue(status: ApiFailure.init, message: '')));
  final Ref ref;

  postSales({required SalesDto sales, required List<FotoDto> fotoDto}) async {
    state = const ProviderValue.loading();
    final hasil = await ProviderValue.guard(
        () => ref.read(salesRepositoryProvider).postSales(salesDto: sales));
    if (hasil.hasError) {
      state = hasil;
      return;
    }
    for (var element in fotoDto) {
      await sendFoto(fotoDto: element, id: hasil.asData?.value.id ?? 0);
    }
    state = hasil;
  }

  Future<ProviderValue<String>> sendFoto(
      {required FotoDto fotoDto, required int id}) async {
    final val = await ProviderValue.guard(() => ref
        .read(salesRepositoryProvider)
        .sendGambarSales(
            id: id, keterangan: fotoDto.keteranganFoto, foto: fotoDto.foto));
    return val;
  }
}

final salesFormProvider =
    StateNotifierProvider<SalesFormNotifier, ProviderValue<SalesDetail>>(
        SalesFormNotifier.new);
