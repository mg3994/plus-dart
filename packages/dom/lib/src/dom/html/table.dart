part of 'html.dart';

/// {@template blogger_theme.html.table}
/// The &lt;table&gt; HTML element represents tabular data—that is, information presented in a two-dimensional table comprised of rows and columns of cells containing data.
/// {@endtemplate}
final class table extends DomComponent {
  const table(super.children, {super.attributes});

  @override
  String get tag => 'table';
}

/// {@template blogger_theme.html.caption}
/// The &lt;caption&gt; HTML element specifies the caption (or title) of a table, providing the table an accessible description.
/// {@endtemplate}
final class caption extends DomComponent {
  const caption(super.children, {super.attributes});

  @override
  String get tag => 'caption';
}

/// {@template blogger_theme.html.thead}
/// The &lt;thead&gt; HTML element encapsulates a set of table rows (&lt;tr&gt; elements), indicating that they comprise the head of a table with information about the table's columns. This is usually in the form of column headers (&lt;th&gt; elements).
/// {@endtemplate}
final class thead extends DomComponent {
  const thead(super.children, {super.attributes});

  @override
  String get tag => 'thead';
}

/// {@template blogger_theme.html.tbody}
/// The &lt;tbody&gt; HTML element encapsulates a set of table rows (&lt;tr&gt; elements), indicating that they comprise the body of a table's (main) data.
/// {@endtemplate}
final class tbody extends DomComponent {
  const tbody(super.children, {super.attributes});

  @override
  String get tag => 'tbody';
}

/// {@template blogger_theme.html.tfoot}
/// The &lt;tfoot&gt; HTML element encapsulates a set of table rows (&lt;tr&gt; elements), indicating that they comprise the foot of a table with information about the table's columns. This is usually a summary of the columns, e.g., a sum of the given numbers in a column.
/// {@endtemplate}
final class tfoot extends DomComponent {
  const tfoot(super.children, {super.attributes});

  @override
  String get tag => 'tfoot';
}

/// {@template blogger_theme.html.th}
/// The &lt;th&gt; HTML element defines a cell as the header of a group of table cells and may be used as a child of the &lt;tr&gt; element. The exact nature of this group is defined by the scope and headers attributes.
/// {@endtemplate}
final class th extends DomComponent {
  const th(super.children, {super.attributes});

  @override
  String get tag => 'th';
}

/// {@template blogger_theme.html.tr}
/// The &lt;tr&gt; HTML element defines a row of cells in a table. The row's cells can then be established using a mix of &lt;td&gt; (data cell) and &lt;th&gt; (header cell) elements.
/// {@endtemplate}
final class tr extends DomComponent {
  const tr(super.children, {super.attributes});

  @override
  String get tag => 'tr';
}

/// {@template blogger_theme.html.td}
/// The &lt;td&gt; HTML element defines a cell of a table that contains data and may be used as a child of the &lt;tr&gt; element.
/// {@endtemplate}
final class td extends DomComponent {
  const td(super.children, {super.attributes});

  @override
  String get tag => 'td';
}

/// {@template blogger_theme.html.col}
/// The &lt;col&gt; HTML element defines one or more columns in a column group represented by its parent &lt;colgroup&gt; element. The &lt;col&gt; element is only valid as a child of a &lt;colgroup&gt; element that has no span attribute defined.
/// {@endtemplate}
final class col extends DomComponent {
  const col({super.attributes}) : super(null);

  @override
  String get tag => 'col';

  @override
  Iterable<Component> build() => [];
}

/// {@template blogger_theme.html.colgroup}
/// The &lt;colgroup&gt; HTML element defines a group of columns within a table.
/// {@endtemplate}
final class colgroup extends DomComponent {
  const colgroup(super.children, {super.attributes});

  @override
  String get tag => 'colgroup';
}
