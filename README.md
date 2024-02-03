Separates list elements by conditionally inserting new elements.

# Overview

This is a handy little package that brings the `separate` extension method to lists/iterables.

Useful for e.g putting space between children in a Row/Column in flutter, similar to `ListView.separated`.

It might be the most straightforward way to add gap between elements like in Figma.

# Basic usage

This package operates on lists/iterables so it's very flexible. Here follows some examples specifically for putting gaps between elements in a Column.
See the example for more details.

## Fixed spacing

```dart
Column(
  children: <Widget>[
    if (imgUrl != null) Header(url: imgUrl),
    Text(name),
    if (age != null) Text(age),
  ].separate((i, e0, e1) => const SizedBox(height: 16)),
)
// i=index, e0=element before, e1=element after
// Basically: "Separate element e0 and e1 with returned element"
```

## Dynamic spacing

```dart
Column(
  children: <Widget>[
    if (imgUrl != null) Header(url: imgUrl),
    Text(name),
    if (age != null) Text(age),
  ].separate(
    (i, e0, e1) => const SizedBox(
      // Increased gap between the header and name
      height: e0 is Header ? 24 : 16,
    ),
  ),
)
```

## Before and after

```dart
Column(
  children: <Widget>[
    if (imgUrl != null) Header(url: imgUrl),
    if (age != null) Text(age),
  ].separate(
    // Put nothing between elements
    (i, e0, e1) => null,
    // Top=32 (only if there are any elements at all)
    before: (first) => const SizedBox(height: 32),
    // Bottom divider, if last item is the header
    after: (last) => last is Header ? const Divider() : null,
  ),
);
```

# Author

- [Martin Sellergren](https://github.com/MartinSellergren)