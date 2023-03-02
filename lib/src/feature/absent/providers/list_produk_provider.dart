import 'package:aice/src/core/config/config.dart';
import 'package:aice/src/feature/absent/absent.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListProdukNotifier
    extends StateNotifier<ProviderValue<List<ProdukModel>>> {
  ListProdukNotifier(this.ref) : super(const ProviderValue.loading());
  final Ref ref;
  loadData() async {
    state = const ProviderLoading();
    state = await ProviderValue.guard(
        () => ref.read(absentRepositoryProvider).getProdukList());
  }
}

final listProdukProvider =
    StateNotifierProvider<ListProdukNotifier, ProviderValue<List<ProdukModel>>>(
        (ref) {
  return ListProdukNotifier(ref);
});
