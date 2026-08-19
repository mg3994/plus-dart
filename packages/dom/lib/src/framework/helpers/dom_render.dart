import '../../dom/raw_text/raw_text.dart' show Text;
import '../framework.dart' show Component, DomComponent;
import 'escape.dart' show escapeXml;

/// Renders a [Component] tree to an XML string.
class Renderer {
  const Renderer();

  String render(Component component, [StringBuffer? sb]) {
    sb ??= StringBuffer();
    _renderComponent(component, sb);
    return sb.toString();
  }

  void _renderComponent(Component component, StringBuffer sb) {
    if (component is Text) {
      sb.write(component.escape ? escapeXml(component.value) : component.value);
    } else if (component is DomComponent) {
      sb.write('<${component.tag}');
      if (component.attributes != null) {
        for (var entry in component.attributes!.entries) {
          sb.write(' ${entry.key}="${escapeXml(entry.value)}"');
        }
      }

      var children = component.build();
      if (children.isEmpty) {
        sb.write('/>');
      } else {
        sb.write('>');
        for (var child in children) {
          _renderComponent(child, sb);
        }
        sb.write('</${component.tag}>');
      }
    } else {
      for (var child in component.build()) {
        _renderComponent(child, sb);
      }
    }
  }
}
