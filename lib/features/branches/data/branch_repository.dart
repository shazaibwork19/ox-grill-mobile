import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../core/providers.dart';
import '../domain/branch.dart';

class BranchRepository {
  BranchRepository(this._api);

  final ApiClient _api;

  Future<List<BranchSummary>> list() =>
      _api.get('/branches', decode: (d) => asJsonList(d, BranchSummary.fromJson));

  Future<BranchDetail> detail(String idOrSlug) => _api.get(
    '/branches/${Uri.encodeComponent(idOrSlug)}',
    decode: (d) => BranchDetail.fromJson(asJsonMap(d)),
  );
}

final branchRepositoryProvider = Provider((ref) => BranchRepository(ref.watch(apiClientProvider)));

final branchesProvider = FutureProvider<List<BranchSummary>>(
  (ref) => ref.watch(branchRepositoryProvider).list(),
);

final branchDetailProvider = FutureProvider.family<BranchDetail, String>(
  (ref, id) => ref.watch(branchRepositoryProvider).detail(id),
);
