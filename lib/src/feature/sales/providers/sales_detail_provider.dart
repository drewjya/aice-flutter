import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SalesDetailNotifier extends StateNotifier<ProviderValue<SalesDetail>> {
  SalesDetailNotifier(this.ref) : super(const ProviderValue.loading());
  final Ref ref;
  loadDetail(int id) async {
    state = const ProviderValue.loading();
    state = await ProviderValue.guard(
        () => ref.read(salesRepositoryProvider).getSalesDetail(salesId: id));
  }
}

final salesDetailProvider =
    StateNotifierProvider<SalesDetailNotifier, ProviderValue<SalesDetail>>(
        SalesDetailNotifier.new);
