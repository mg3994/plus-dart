import 'package:collection/collection.dart';

import '../dom/raw_text/raw_text.dart';

/// A node in the Blogger theme component tree.
///
/// All renderable objects in this package implement [Component].
abstract class Component {
  const Component();
  Iterable<Component> build();

  /// Creates a text node component.
  const factory Component.text(String value, {bool escape}) = Text;

  /// Creates a custom DOM component node.
  const factory Component.element(
    String tag, {
    List<Component>? children,
    Map<String, String>? attributes,
  }) = CustomDomComponent;

  /// Groups components together without creating a DOM node.
  const factory Component.fragment([Iterable<Component> children]) = Fragment;

  /// Creates an empty component that renders nothing.
  const factory Component.empty() = Fragment.empty;
}

/// A DOM-like element with a tag, attributes, and child components.
abstract class DomComponent extends Component {
  String get tag;
  final Iterable<Component>? children;
  final Map<String, String>? attributes;

  const DomComponent(this.children, {this.attributes});

  @override
  Iterable<Component> build() => children ?? [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const MapEquality().equals;
    final iterableEquals = const IterableEquality().equals;

    return other is DomComponent &&
        other.tag == tag &&
        mapEquals(other.attributes, attributes) &&
        iterableEquals(other.children, children);
  }

  @override
  int get hashCode => Object.hash(
    tag,
    const MapEquality().hash(attributes),
    const IterableEquality().hash(children),
  );
}

/// Concrete implementation of [DomComponent] used for custom or dynamic XML elements.
class CustomDomComponent extends DomComponent {
  @override
  final String tag;

  const CustomDomComponent(
    this.tag, {
    Iterable<Component>? children,
    Map<String, String>? attributes,
  }) : super(children, attributes: attributes);
}

/// A wrapper for grouping components without introducing a DOM tag.
class Fragment extends Component {
  final Iterable<Component> children;

  const Fragment([this.children = const []]);

  /// Creates an empty fragment.
  const Fragment.empty() : children = const [];

  @override
  Iterable<Component> build() => children;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Fragment &&
        const IterableEquality().equals(other.children, children);
  }

  @override
  int get hashCode => const IterableEquality().hash(children);
}
