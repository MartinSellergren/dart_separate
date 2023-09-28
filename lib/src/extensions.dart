import 'package:collection/collection.dart';

extension SeparateIterable<T> on Iterable<T> {
  /// Separates the list elements by conditionally inserting new elements.
  ///
  /// Return null if no element is to be inserted at this position.
  /// [between] does nothing if length < 2.
  /// [before], [after] does nothing if list is empty.
  Iterable<T> separate(
    T? Function(int i, T e0, T e1) between, {
    T? Function(T first)? before,
    T? Function(T last)? after,
  }) {
    return [
      if (before != null && isNotEmpty) before(first),
      ...expandIndexed(
        (index, element) => [
          element,
          if (index < length - 1) between(index, element, elementAt(index + 1)),
        ],
      ),
      if (after != null && isNotEmpty) after(last),
    ].whereType<T>();
  }
}

extension SeparateList<T> on List<T> {
  /// Separates the list elements by conditionally inserting new elements.
  ///
  /// Return null if no element is to be inserted at this position.
  /// [between] does nothing if length < 2.
  /// [before], [after] does nothing if list is empty.
  List<T> separate(
    T? Function(int i, T e0, T e1) between, {
    T? Function(T first)? before,
    T? Function(T last)? after,
  }) {
    return map((e) => e)
        .separate(between, before: before, after: after)
        .toList();
  }
}
