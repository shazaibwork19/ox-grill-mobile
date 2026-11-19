import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../../core/providers.dart';
import '../domain/admin_models.dart';
import 'session.dart';

/// All branches (owner only), including inactive ones.
final adminBranchesProvider = FutureProvider<List<BranchAdmin>>((ref) {
  return ref
      .watch(staffApiProvider)
      .get('/admin/branches', decode: (d) => asJsonList(d, BranchAdmin.fromJson));
});

/// The branch the signed-in person is working on.
///
/// Staff: always their own branch. Owner: the branch picked in the header,
/// remembered on the device; `null` means "all branches" for screens that
/// support it (dashboard, orders, reports).
class ActiveBranch extends Notifier<String?> {
  static const _key = 'staff.ownerBranch.v1';

  @override
  String? build() {
    final session = ref.watch(sessionProvider).value;
    if (session == null) return null;
    if (session.ownBranchId != null) return session.ownBranchId;
    return ref.read(sharedPreferencesProvider).getString(_key);
  }

  Future<void> choose(String? branchId) async {
    state = branchId;
    final prefs = ref.read(sharedPreferencesProvider);
    if (branchId == null) {
      await prefs.remove(_key);
    } else {
      await prefs.setString(_key, branchId);
    }
  }
}

final activeBranchProvider = NotifierProvider<ActiveBranch, String?>(ActiveBranch.new);

/// Display name of the active branch.
final activeBranchNameProvider = Provider<String>((ref) {
  final session = ref.watch(sessionProvider).value;
  final id = ref.watch(activeBranchProvider);
  if (session?.ownBranchName != null) return session!.ownBranchName!;
  if (id == null) return 'All branches';
  final list = ref.watch(adminBranchesProvider).value ?? const [];
  for (final b in list) {
    if (b.id == id) return b.name;
  }
  return 'Branch';
});
