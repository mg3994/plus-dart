part of 'html.dart';

/// {@template blogger_theme.html.article}
/// The &lt;article&gt; HTML element represents a self-contained composition in a document, page, application, or site, which is intended to be independently distributable or reusable (e.g., in syndication). Examples include: a forum post, a magazine or newspaper article, or a blog entry, a product card, a user-submitted comment, an interactive widget or gadget, or any other independent item of content.
/// {@endtemplate}
final class article extends DomComponent {
  const article(super.children, {super.attributes});

  @override
  String get tag => 'article';
}

/// {@template blogger_theme.html.aside}
/// The &lt;aside&gt; HTML element represents a portion of a document whose content is
/// only indirectly related to the document's main content. Asides are frequently presented as sidebars or call-out boxes.
/// {@endtemplate}
final class aside extends DomComponent {
  const aside(super.children, {super.attributes});

  @override
  String get tag => 'aside';
}

/// {@template blogger_theme.html.body}
/// The &lt;body&gt; HTML element represents the content of an HTML document. There can be only one &lt;body&gt; element in a document.
/// {@endtemplate}
final class body extends DomComponent {
  const body(super.children, {super.attributes});

  @override
  String get tag => 'body';
}

/// {@template blogger_theme.html.footer}
/// The &lt;footer&gt; HTML element represents a footer for its nearest ancestor sectioning content or sectioning root element. A footer typically contains information about the author of the section, copyright data or links to related documents.
/// {@endtemplate}
final class footer extends DomComponent {
  const footer(super.children, {super.attributes});

  @override
  String get tag => 'footer';
}

/// {@template blogger_theme.html.head}
/// The &lt;head&gt; HTML element contains machine-readable information (metadata) about the document, like its title, scripts, and style sheets.
/// {@endtemplate}
final class head extends DomComponent {
  const head(super.children, {super.attributes});

  @override
  String get tag => 'head';
}

/// {@template blogger_theme.html.header}
/// The &lt;header&gt; HTML element represents introductory content, typically a group of introductory
/// or navigational aids. It may contain some heading elements but also a logo, a search form, an author name, and other elements.
/// {@endtemplate}
final class header extends DomComponent {
  const header(super.children, {super.attributes});

  @override
  String get tag => 'header';
}

/// {@template blogger_theme.html.html}
/// The &lt;html&gt; HTML element represents the root (top-level element) of an HTML document, so it is also referred to as the root element. All other elements must be descendants of this element.
/// {@endtemplate}
final class html extends DomComponent {
  const html(super.children, {super.attributes});

  @override
  String get tag => 'html';
}

/// {@template blogger_theme.html.title}
/// The &lt;h1&gt; title in Nav Browser Client
/// {@endtemplate}
final class title extends DomComponent {
  const title(super.children);
  @override
  String get tag => 'title';
}

///  {@template blogger_theme.html.h1}
/// The &lt;h1&gt; HTML element represents a level 1 heading. It is used to define the most important heading on the page, typically used for the main title or topic of the content.
/// {@endtemplate}
final class h1 extends DomComponent {
  const h1(super.children, {super.attributes});

  @override
  String get tag => 'h1';
}

///  {@template blogger_theme.html.h2}
/// The &lt;h2&gt; HTML element represents a level 2 heading. It is used to define subheadings or secondary titles within a document, providing a hierarchical structure to the content.
/// {@endtemplate}
final class h2 extends DomComponent {
  const h2(super.children, {super.attributes});

  @override
  String get tag => 'h2';
}

/// {@template blogger_theme.html.h3}
/// The &lt;h3&gt; HTML element represents a level 3 heading. It is used to define subheadings or tertiary titles within a document, providing further hierarchical structure to the content.
/// {@endtemplate}
final class h3 extends DomComponent {
  const h3(super.children, {super.attributes});

  @override
  String get tag => 'h3';
}

/// {@template blogger_theme.html.h4}
/// The &lt;h4&gt; HTML element represents a level 4 heading. It is used to define subheadings or quaternary titles within a document, providing additional hierarchical structure to the content.
/// {@endtemplate}
final class h4 extends DomComponent {
  const h4(super.children, {super.attributes});

  @override
  String get tag => 'h4';
}

/// {@template blogger_theme.html.h5}
/// The &lt;h5&gt; HTML element represents a level 5 heading. It
/// is used to define subheadings or quinary titles within a document, providing further hierarchical structure to the content.
/// {@endtemplate}
final class h5 extends DomComponent {
  const h5(super.children, {super.attributes});

  @override
  String get tag => 'h5';
}

/// {@template blogger_theme.html.h6}
/// The &lt;h6&gt; HTML element represents a level 6 heading. It is used to define subheadings or senary titles within a document, providing the lowest level of hierarchical structure to the content.
/// {@endtemplate}
final class h6 extends DomComponent {
  const h6(super.children, {super.attributes});

  @override
  String get tag => 'h6';
}

/// {@template blogger_theme.html.main}
/// The &lt;main&gt; HTML element represents the dominant content of the &lt;body&gt; of a document. The main content area consists of content that is directly related to or expands upon the central topic of a document, or the central functionality of an application.
/// {@endtemplate}
final class main_ extends DomComponent {
  const main_(super.children, {super.attributes});

  @override
  String get tag => 'main';
}

/// {@template blogger_theme.html.nav}
/// The &lt;nav&gt; HTML element represents a section of a page whose purpose is to provide navigation links, either within the current document or to other documents. Common examples of navigation sections are menus, tables of contents, and indexes.
/// {@endtemplate}
final class nav extends DomComponent {
  const nav(super.children, {super.attributes});
  @override
  String get tag => 'nav';
}

/// {@template blogger_theme.html.section}
/// The &lt;section&gt; HTML element represents a generic standalone section of a document, which doesn't have a more specific semantic element to represent it. Sections should always have a heading, with very few exceptions.
/// {@endtemplate}
final class section extends DomComponent {
  const section(super.children, {super.attributes});
  @override
  String get tag => 'section';
}

/// {@template blogger_theme.html.blockquote}
/// The &lt;blockquote&gt; HTML element indicates that the enclosed text is an extended quotation. Usually, this is rendered visually by indentation. A URL for the source of the quotation may be given using the cite attribute, while a text representation of the source can be given using the &lt;cite&gt; element.
/// {@endtemplate}
final class blockquote extends DomComponent {
  const blockquote(super.children, {super.attributes});
  @override
  String get tag => 'blockquote';
}

/// {@template blogger_theme.html.dd}
/// The &lt;dd&gt; HTML element provides the description, definition, or value for the preceding term (&lt;dt&gt;) in a description list (&lt;dl&gt;).
/// {@endtemplate}
final class dd extends DomComponent {
  const dd(super.children, {super.attributes});
  @override
  String get tag => 'dd';
}

/// {@template blogger_theme.html.div}
/// The &lt;div&gt; HTML element is the generic container for flow content. It has no effect on the content or layout until styled in some way using CSS (e.g. styling is directly applied to it, or some kind of layout model like Flexbox is applied to its parent element).
/// {@endtemplate}
final class div extends DomComponent {
  const div(super.children, {super.attributes});
  @override
  String get tag => 'div';
}

/// {@template blogger_theme.html.dl}
/// The &lt;dl&gt; HTML element represents a description list. The element encloses a list of groups of terms (specified using the &lt;dt&gt; element) and descriptions (provided by &lt;dd&gt; elements). Common uses for this element are to implement a glossary or to display metadata (a list of key-value pairs).
/// {@endtemplate}
final class dl extends DomComponent {
  const dl(super.children, {super.attributes});
  @override
  String get tag => 'dl';
}

/// {@template blogger_theme.html.dt}
/// The &lt;dt&gt; HTML element specifies a term in a description or definition list, and as such must be used inside a &lt;dl&gt; element. It is usually followed by a &lt;dd&gt; element; however, multiple &lt;dt&gt; elements in a row indicate several terms that are all defined by the immediate next &lt;dd&gt; element.
///
/// The subsequent &lt;dd&gt; (Description Details) element provides the definition or other related text associated with the term specified using &lt;dt&gt;.
/// {@endtemplate}
final class dt extends DomComponent {
  const dt(super.children, {super.attributes});
  @override
  String get tag => 'dt';
}

/// {@template blogger_theme.html.ul}
/// The &lt;ul&gt; HTML element represents an unordered list of items, typically rendered as a bulleted list.
/// {@endtemplate}
final class ul extends DomComponent {
  const ul(super.children, {super.attributes});
  @override
  String get tag => 'ul';
}

/// {@template blogger_theme.html.ol}
/// The &lt;ol&gt; HTML element represents an ordered list of items — typically rendered as a numbered list.
/// {@endtemplate}
final class ol extends DomComponent {
  const ol(super.children, {super.attributes});
  @override
  String get tag => 'ol';
}

/////

/// {@template blogger_theme.html.li}
/// The &lt;li&gt; HTML element is used to represent an item in a list. It must be contained in a parent element: an ordered list (&lt;ol&gt;), an unordered list (&lt;ul&gt;), or a menu (&lt;menu&gt;). In menus and unordered lists, list items are usually displayed using bullet points. In ordered lists, they are usually displayed with an ascending counter on the left, such as a number or letter.
/// {@endtemplate}
final class li extends DomComponent {
  const li(super.children, {super.attributes});
  @override
  String get tag => 'li';
}

/// {@template blogger_theme.html.hr}
/// The &lt;hr&gt; HTML element represents a thematic break between paragraph-level elements: for example, a change of scene in a story, or a shift of topic within a section.
/// {@endtemplate}
final class hr extends DomComponent {
  const hr({super.attributes}):super(null);
  @override
  String get tag => 'hr';
  @override
  Iterable<Component> build() => [];
}

/// {@template blogger_theme.html.p}
/// The &lt;p&gt; HTML element represents a paragraph. Paragraphs are usually represented in visual media as blocks of text separated from adjacent blocks by blank lines and/or first-line indentation, but HTML paragraphs can be any structural grouping of related content, such as images or form fields.
/// {@endtemplate}
final class p extends DomComponent {
  const p(super.children, {super.attributes});
  @override
  String get tag => 'p';
}

/// {@template blogger_theme.html.pre}
/// The &lt;pre&gt; HTML element represents preformatted text which is to be presented exactly as written in the HTML file. The text is typically rendered using a non-proportional, or monospaced, font. Whitespace inside this element is displayed as written.
/// {@endtemplate}
final class pre extends DomComponent {
  const pre(super.children, {super.attributes});
  @override
  String get tag => 'pre';
}
