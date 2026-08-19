part of 'html.dart';

/// {@template blogger_theme.html.details}
/// The &lt;details&gt; HTML element creates a disclosure widget in which information is visible only when the widget is toggled into an "open" state. A summary or label must be provided using the &lt;summary&gt; element.
/// {@endtemplate}
final class details extends DomComponent {
  const details(super.children, {super.attributes});

  @override
  String get tag => 'details';
}

/// {@template blogger_theme.html.dialog}
/// The &lt;dialog&gt; HTML element represents a dialog box or other interactive component, such as a dismissible alert, inspector, or subwindow.
/// {@endtemplate}
final class dialog extends DomComponent {
  const dialog(super.children, {super.attributes});

  @override
  String get tag => 'dialog';
}

/// {@template blogger_theme.html.summary}
/// The &lt;summary&gt; HTML element specifies a summary, caption, or legend for a &lt;details&gt; element's disclosure box. Clicking the &lt;summary&gt; element toggles the state of the parent &lt;details&gt; element open and closed.
/// {@endtemplate}
final class summary extends DomComponent {
  const summary(super.children, {super.attributes});

  @override
  String get tag => 'summary';
}

/// {@template blogger_theme.html.meta}
/// The &lt;meta&gt; HTML element represents metadata that cannot be represented by other HTML meta-related elements, like &lt;base&gt;, &lt;link&gt;, &lt;script&gt;, &lt;style&gt; or &lt;title&gt;.
/// {@endtemplate}
final class meta extends DomComponent {
  const meta({super.attributes}) : super(null);

  @override
  String get tag => 'meta';

  @override
  Iterable<Component> build() => const [];
}

/// {@template blogger_theme.html.link}
/// The &lt;link&gt; HTML element specifies relationships between the current document and an external resource. This element is most commonly used to link to stylesheets, but is also used to establish site icons (both "favicon" style icons and icons for the home screen and apps on mobile devices) among other things.
/// {@endtemplate}
final class link extends DomComponent {
  const link({super.attributes}) : super(null);

  @override
  String get tag => 'link';

  @override
  Iterable<Component> build() => [];
}

/// {@template blogger_theme.html.script}
/// The &lt;script&gt; HTML element is used to embed executable code or data; this is typically used to embed or refer to JavaScript code. The &lt;script&gt; element can also be used with other languages, such as WebGL's GLSL shader programming language and JSON.
/// {@endtemplate}
final class script extends DomComponent {
  const script(super.children, {super.attributes});

  @override
  String get tag => 'script';
}
