import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'sales_repository.dart';

class SalesRepositoryImpl extends SalesRepository {
  // TODO add your methods here
}

final salesRepositoryProvider = Provider<SalesRepository>((ref) {
  return SalesRepositoryImpl();
});
