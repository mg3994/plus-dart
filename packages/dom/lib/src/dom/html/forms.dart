part of 'html.dart';

/// {@template blogger_theme.html.button}
/// The <button> HTML element is an interactive element activated by a user with a mouse, keyboard, finger, voice command, or other assistive technology. Once activated, it performs an action, such as submitting a form or opening a dialog.
/// {@endtemplate}
final class button extends DomComponent {
  const button(super.children, {super.attributes});

  @override
  String get tag => 'button';
}

/// {@template blogger_theme.html.datalist}
/// The <datalist> HTML element contains a set of <option> elements that represent the permissible or recommended options available to choose from within other controls.
/// {@endtemplate}
final class datalist extends DomComponent {
  const datalist(super.children, {super.attributes});

  @override
  String get tag => 'datalist';
}

/// {@template blogger_theme.html.fieldset}
/// The <fieldset> HTML element is used to group several controls, as well as labels (<label>), within a web form.
/// {@endtemplate}
final class fieldset extends DomComponent {
  const fieldset(super.children, {super.attributes});

  @override
  String get tag => 'fieldset';
}

/// {@template blogger_theme.html.form}
/// The <form> HTML element represents a document section containing interactive controls for submitting information.
/// {@endtemplate}
final class form extends DomComponent {
  const form(super.children, {super.attributes});

  @override
  String get tag => 'form';
}

/// {@template blogger_theme.html.input}
/// The <input> HTML element is used to create interactive controls for web-based forms in order to accept data from the user; a wide variety of types of input data and control widgets are available, depending on the device and user agent.
/// {@endtemplate}
final class input extends DomComponent {
  const input({super.attributes}) : super(null);

  @override
  String get tag => 'input';
  @override
  Iterable<Component> build() => [];
}

/// {@template blogger_theme.html.label}
/// The <label> HTML element represents a caption for an item in a user interface.
/// {@endtemplate}
final class label extends DomComponent {
  const label(super.children, {super.attributes});

  @override
  String get tag => 'label';
}

/// {@template blogger_theme.html.legend}
/// The <legend> HTML element represents a caption for the content of its parent <fieldset>.
/// {@endtemplate}
final class legend extends DomComponent {
  const legend(super.children, {super.attributes});

  @override
  String get tag => 'legend';
}

/// {@template blogger_theme.html.meter}
/// The <meter> HTML element represents either a scalar value within a known range or a fractional value.
/// {@endtemplate}
final class meter extends DomComponent {
  const meter(super.children, {super.attributes});

  @override
  String get tag => 'meter';
}

/// {@template blogger_theme.html.optgroup}
/// The <optgroup> HTML element creates a grouping of options within a <select> element.
/// {@endtemplate}
final class optgroup extends DomComponent {
  const optgroup(super.children, {super.attributes});

  @override
  String get tag => 'optgroup';
}

/// {@template blogger_theme.html.option}
/// The <option> HTML element is used to define an item contained in a <select>, an <optgroup>, or a <datalist> element.
/// {@endtemplate}
final class option extends DomComponent {
  const option(super.children, {super.attributes});

  @override
  String get tag => 'option';
}

/// {@template blogger_theme.html.output}
/// The <output> HTML element is a container element into which a site or app can inject the results of a calculation or the outcome of a user action.
/// {@endtemplate}
final class output extends DomComponent {
  const output(super.children, {super.attributes});

  @override
  String get tag => 'output';
}

/// {@template blogger_theme.html.progress}
/// The <progress> HTML element displays an indicator showing the completion progress of a task, typically displayed as a progress bar.
/// {@endtemplate}
final class progress extends DomComponent {
  const progress(super.children, {super.attributes});

  @override
  String get tag => 'progress';
}

/// {@template blogger_theme.html.select}
/// The <select> HTML element represents a control that provides a menu of options.
/// {@endtemplate}
final class select extends DomComponent {
  const select(super.children, {super.attributes});

  @override
  String get tag => 'select';
}

/// {@template blogger_theme.html.textarea}
/// The <textarea> HTML element represents a multi-line plain-text editing control, useful when the user wants to enter a sizable amount of free-form text, for example a comment on a review or feedback form.
/// {@endtemplate}
final class textarea extends DomComponent {
  const textarea(super.children, {super.attributes});

  @override
  String get tag => 'textarea';
}
