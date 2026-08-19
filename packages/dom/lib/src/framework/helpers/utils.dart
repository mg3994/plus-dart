// =============================================================================
// Extensions
// =============================================================================

import '../../dom/raw_text/raw_text.dart' show Text;
import '../framework.dart' show Component, DomComponent, Fragment, CustomDomComponent;
import 'dom_render.dart' show Renderer;

/// Converts string literals into [Text] components.
extension StringAsComponent on String {
  Component get component => Text(this);
}

/// Extension on [Component] to enable direct rendering.
extension RenderComponentExtension on Component {
  /// Renders this component tree to an XML string using an optional custom [Renderer].
  String render([Renderer renderer = const Renderer(), StringBuffer? sb]) {
    sb ??= StringBuffer();
    return renderer.render(this, sb);
  }
}

/// Extension to easily create dynamic/custom [DomComponent]s using any tag name.
extension CustomDomComponentExtension on String {
  /// Creates a custom [DomComponent] using this string as the tag name.
  DomComponent tag({
    List<Component>? children,
    Map<String, String>? attributes,
  }) {
    return CustomDomComponent(this, children: children, attributes: attributes);
  }
}

extension IterableComponentExtension on Iterable<Component> {
  /// Wraps a list of components in a Fragment.
  Fragment get fragment => Fragment(this);
}
