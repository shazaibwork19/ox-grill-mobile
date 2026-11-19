import '../../../core/money/money.dart';
import '../../cart/domain/cart.dart';
import 'menu.dart';

/// The customer's option choices for one item, enforcing each group's
/// `minSelect` / `maxSelect`. Immutable; every change returns a new value.
class OptionSelection {
  const OptionSelection._(this.item, this._chosen);

  /// Starts from the server's defaults (`isDefault`), capped at `maxSelect`.
  factory OptionSelection.initial(MenuItemDetail item) {
    final chosen = <String, List<String>>{};
    for (final g in item.orderedGroups) {
      final defaults = g.activeOptions.where((o) => o.isDefault).map((o) => o.id).take(g.maxSelect).toList();
      chosen[g.id] = defaults;
    }
    return OptionSelection._(item, chosen);
  }

  /// Restores a cart line's choices; ids that no longer exist are dropped.
  factory OptionSelection.fromLine(MenuItemDetail item, CartLine line) {
    final picked = line.optionIds.toSet();
    final chosen = <String, List<String>>{
      for (final g in item.orderedGroups)
        g.id: g.activeOptions.where((o) => picked.contains(o.id)).map((o) => o.id).take(g.maxSelect).toList(),
    };
    return OptionSelection._(item, chosen);
  }

  final MenuItemDetail item;
  final Map<String, List<String>> _chosen;

  List<String> chosenIn(MenuOptionGroup group) => _chosen[group.id] ?? const [];

  bool isSelected(MenuOptionGroup group, MenuOption option) => chosenIn(group).contains(option.id);

  /// Single-choice groups switch to [option]. Multi-choice groups toggle it,
  /// ignoring a new pick once `maxSelect` is reached.
  OptionSelection toggle(MenuOptionGroup group, MenuOption option) {
    final current = chosenIn(group);
    final List<String> next;
    if (group.isSingleChoice) {
      next = current.contains(option.id) && !group.isRequired ? const [] : [option.id];
    } else if (current.contains(option.id)) {
      next = current.where((id) => id != option.id).toList();
    } else if (current.length >= group.maxSelect) {
      return this;
    } else {
      next = [...current, option.id];
    }
    return OptionSelection._(item, {..._chosen, group.id: next});
  }

  bool canAddMore(MenuOptionGroup group) => chosenIn(group).length < group.maxSelect;

  /// First group whose rule is not met yet, in display order.
  MenuOptionGroup? get firstUnmetGroup {
    for (final g in item.orderedGroups) {
      if (chosenIn(g).length < g.minSelect) return g;
    }
    return null;
  }

  bool get isComplete => firstUnmetGroup == null;

  /// Why "Add" is disabled, e.g. "Choose 1: Choose Your Preference".
  String? get blockingReason {
    final g = firstUnmetGroup;
    if (g == null) return null;
    final missing = g.minSelect - chosenIn(g).length;
    return missing == g.minSelect
        ? '${g.ruleLabel.replaceFirst('Optional · ', '')} from “${g.name}”'
        : 'Choose $missing more from “${g.name}”';
  }

  List<CartOption> get cartOptions => [
    for (final g in item.orderedGroups)
      for (final o in g.activeOptions)
        if (chosenIn(g).contains(o.id))
          CartOption(id: o.id, groupId: g.id, groupName: g.name, name: o.name, priceDelta: o.priceDelta),
  ];

  /// Menu price + chosen option deltas. Display only; the server prices the order.
  Money get unitEstimate => Money(item.price + cartOptions.fold(0, (s, o) => s + o.priceDelta));
}
