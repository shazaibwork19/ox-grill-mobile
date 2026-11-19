import '../domain/menu.dart';

/// One category and its items, in display order.
class MenuSection {
  const MenuSection({required this.category, required this.items});

  final MenuCategory category;
  final List<MenuItem> items;
}

/// Groups items under their categories (server sort order), dropping empty
/// and inactive categories.
List<MenuSection> buildSections(MenuResponse menu) {
  final byCategory = <String, List<MenuItem>>{};
  for (final item in menu.items) {
    byCategory.putIfAbsent(item.categoryId, () => []).add(item);
  }
  final categories =
      menu.categories.where((c) => c.isActive && (byCategory[c.id]?.isNotEmpty ?? false)).toList()
        ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  return [for (final c in categories) MenuSection(category: c, items: byCategory[c.id]!)];
}

/// Case-insensitive match on name, description, category and tags.
List<MenuItem> searchItems(MenuResponse menu, String query) {
  final q = query.trim().toLowerCase();
  if (q.isEmpty) return const [];
  bool hit(String s) => s.toLowerCase().contains(q);
  return menu.items
      .where((i) => hit(i.name) || hit(i.description) || hit(i.categoryName) || i.tags.any(hit))
      .toList();
}

/// Pure geometry for the sectioned menu so scroll-spy and tap-to-scroll are
/// arithmetic instead of measuring widgets that may not be built yet.
class MenuGeometry {
  MenuGeometry({
    required List<int> itemCounts,
    required this.columns,
    required this.headerExtent,
    required this.itemExtent,
    required this.sectionGap,
  }) {
    var offset = 0.0;
    for (final n in itemCounts) {
      _offsets.add(offset);
      final rows = (n / columns).ceil();
      final extent = headerExtent + rows * itemExtent + sectionGap;
      _extents.add(extent);
      offset += extent;
    }
    totalExtent = offset;
  }

  final int columns;
  final double headerExtent;
  final double itemExtent;
  final double sectionGap;
  final List<double> _offsets = [];
  final List<double> _extents = [];
  late final double totalExtent;

  int get length => _offsets.length;

  /// Offset of section [i] from the start of the first section.
  double offsetOf(int i) => _offsets[i];

  double extentOf(int i) => _extents[i];

  /// Section showing at the top of the viewport for [scrolledIntoSections]
  /// pixels past the start of the first section.
  int activeIndexAt(double scrolledIntoSections) {
    var active = 0;
    for (var i = 0; i < _offsets.length; i++) {
      if (_offsets[i] <= scrolledIntoSections + 1) active = i;
    }
    return active;
  }
}
