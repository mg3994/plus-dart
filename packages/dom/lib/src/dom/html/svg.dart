part of 'html.dart';

/// {@template blogger_theme.html.svg}
/// The &lt;svg&gt; element is a container that defines a new coordinate system and viewport. It is used as the outermost element of SVG documents, but it can also be used to embed an SVG fragment inside an SVG or HTML document.
/// {@endtemplate}
final class svg extends DomComponent {
  const svg(super.children, {super.attributes});

  @override
  String get tag => 'svg';
}

/// {@template blogger_theme.html.rect}
/// The &lt;rect&gt; element is a basic SVG shape that draws rectangles, defined by their position, width, and height. The rectangles may have their corners rounded.
/// {@endtemplate}
final class rect extends DomComponent {
  const rect(super.children, {super.attributes});

  @override
  String get tag => 'rect';
}

/// {@template blogger_theme.html.circle}
/// The &lt;circle&gt; SVG element is an SVG basic shape, used to draw circles based on a center point and a radius.
/// {@endtemplate}
final class circle extends DomComponent {
  const circle(super.children, {super.attributes});

  @override
  String get tag => 'circle';
}

/// {@template blogger_theme.html.ellipse}
/// The &lt;ellipse&gt; element is an SVG basic shape, used to create ellipses based on a center coordinate, and both their x and y radius.
/// {@endtemplate}
final class ellipse extends DomComponent {
  const ellipse(super.children, {super.attributes});

  @override
  String get tag => 'ellipse';
}

/// {@template blogger_theme.html.line}
/// The &lt;line&gt; element is an SVG basic shape used to create a line connecting two points.
/// {@endtemplate}
final class line extends DomComponent {
  const line(super.children, {super.attributes});

  @override
  String get tag => 'line';
}

/// {@template blogger_theme.html.path}
/// The &lt;path&gt; SVG element is the generic element to define a shape. All the basic shapes can be created with a path element.
/// {@endtemplate}
final class path extends DomComponent {
  const path(super.children, {super.attributes});

  @override
  String get tag => 'path';
}

/// {@template blogger_theme.html.polygon}
/// The &lt;polygon&gt; element defines a closed shape consisting of a set of connected straight line segments. The last point is connected to the first point.
/// {@endtemplate}
final class polygon extends DomComponent {
  const polygon(super.children, {super.attributes});

  @override
  String get tag => 'polygon';
}

/// {@template blogger_theme.html.polyline}
/// The &lt;polyline&gt; SVG element is an SVG basic shape that creates straight lines connecting several points. Typically a polyline is used to create open shapes as the last point doesn't have to be connected to the first point.
/// {@endtemplate}
final class polyline extends DomComponent {
  const polyline(super.children, {super.attributes});

  @override
  String get tag => 'polyline';
}

/// {@template blogger_theme.html.use}
/// The &lt;use&gt; element takes nodes from within the SVG document, and duplicates them elsewhere.
/// {@endtemplate}
final class use extends DomComponent {
  const use(super.children, {super.attributes});

  @override
  String get tag => 'use';
}

/// {@template blogger_theme.html.g}
/// The &lt;g&gt; SVG element is a container used to group other SVG elements.
/// {@endtemplate}
final class g extends DomComponent {
  const g(super.children, {super.attributes});

  @override
  String get tag => 'g';
}
