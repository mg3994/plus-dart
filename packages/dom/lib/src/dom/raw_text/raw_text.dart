import '../../framework/framework.dart' show Component;

/// A text node that is rendered with optional XML escaping.
final class Text extends Component {
  final String value;
  final bool escape;

  const Text(this.value, {this.escape = true});

  @override
  Iterable<Component> build() => [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Text && other.value == value && other.escape == escape;
  }

  @override
  int get hashCode => Object.hash(value, escape);
}

/// A raw text node that disables XML escaping.
final class RawText extends Text {
  const RawText(super.value, {super.escape = false});
}
