Separates list elements by conditionally inserting new elements.

## Features

This is a handy little package that brings the `separate` extension method to lists/iterables.

Useful for e.g putting padding between children in a Row/Column in flutter, similar to `ListView.separated`.

## Usage

```dart
[].separate((i, e0, e1) => null); // []
[].separate((i, e0, e1) => 0); // []
[1, 2, 3].separate((i, e0, e1) => null); // [1, 2, 3]
[1, 2, 3].separate((i, e0, e1) => 0); // [1, 0, 2, 0, 3]
[1, 2, 3].separate((i, e0, e1) => e0 == 2 ? 0 : null); // [1, 2, 0, 3]
[].separate(
  (i, e0, e1) => null,
  before: (first) => -1000,
  after: (last) => 1000,
); // []
[1, 2, 3].separate(
  (i, e0, e1) => null,
  before: (first) => -1000,
  after: (last) => 1000,
); // [-1000, 1, 2, 3, 1000]
```
