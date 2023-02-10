import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SalesHistoryNotifier
    extends StateNotifier<ProviderValue<List<SalesHistoryModel>>> {
  SalesHistoryNotifier(this.ref) : super(const ProviderValue.loading()) {
    load();
  }
  final Ref ref;
  load() async {
    state = const ProviderValue.loading();
    state = await ProviderValue.guard(
        () => ref.read(salesRepositoryProvider).getSalesHistoryToday());
  }
}

class SalesHistoryThisWeekNotifier
    extends StateNotifier<ProviderValue<List<SalesHistoryModel>>> {
  SalesHistoryThisWeekNotifier(this.ref)
      : super(const ProviderValue.loading()) {
    load();
  }
  final Ref ref;
  load() async {
    state = const ProviderValue.loading();
    state = await ProviderValue.guard(
        () => ref.read(salesRepositoryProvider).getSalesHistoryThisWeek());
  }
}

final salesHistoryTodayProvider = StateNotifierProvider<SalesHistoryNotifier,
    ProviderValue<List<SalesHistoryModel>>>(SalesHistoryNotifier.new);
final salesHistoryThisWeekProvider = StateNotifierProvider<
    SalesHistoryThisWeekNotifier,
    ProviderValue<List<SalesHistoryModel>>>(SalesHistoryThisWeekNotifier.new);
