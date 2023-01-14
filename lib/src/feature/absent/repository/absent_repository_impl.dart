import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'absent_repository.dart';

class AbsentRepositoryImpl extends AbsentRepository {
  // TODO add your methods here
}

final absentRepositoryProvider = Provider<AbsentRepository>((ref) {
  return AbsentRepositoryImpl();
});
