import '../../framework/framework.dart'
    show DomComponent, Component, CustomDomComponent;
import '../raw_text/raw_text.dart' show Text, RawText;

/// A Blogger section container, mapped to the `b:section` template tag.
class BSection extends DomComponent {
  final String id;
  final String? className;
  final int? maxwidgets;
  final bool? showaddelement;
  final String? growth;
  final bool? preferred;

  @override
  String get tag => 'b:section';

  BSection({
    required this.id,
    Iterable<Component>? children,
    this.className,
    this.maxwidgets,
    this.showaddelement,
    this.growth,
    this.preferred,
  }) : super(
         children,
         attributes: {
           'id': id,
           'class': ?className,
           'maxwidgets': ?maxwidgets?.toString(),
           if (showaddelement != null)
             'showaddelement': showaddelement ? 'yes' : 'no',
           'growth': ?growth,
           'preferred': ?preferred?.toString(),
         },
       );
}

/// Marks where widget settings can be declared inside a Blogger layout.
class BWidgetSettings extends DomComponent {
  @override
  String get tag => 'b:widget-settings';

  const BWidgetSettings([super.children]);
}

/// Represents a named widget setting element.
class BWidgetSetting extends DomComponent {
  final String name;

  @override
  String get tag => 'b:widget-setting';

  BWidgetSetting({required this.name, Iterable<Component>? children})
    : super(children, attributes: {'name': name});
}

/// Models a Blogger widget definition in the template.
class BWidget extends DomComponent {
  final String id;
  final String type;
  final String? title;
  final bool? locked;
  final String? pageType;
  final String? mobile;
  final int? version;
  final bool? isVisible;

  @override
  String get tag => 'b:widget';

  BWidget({
    required this.id,
    required this.type,
    this.title,
    this.locked,
    this.pageType,
    this.mobile,
    this.version,
    this.isVisible,
    Iterable<Component>? children,
  }) : super(
         children,
         attributes: {
           'id': id,
           'type': type,
           'title': ?title,
           'locked': ?locked?.toString(),
           'pageType': ?pageType,
           'mobile': ?mobile,
           'version': ?version?.toString(),
           'visible': ?isVisible?.toString(),
         },
       );
}

/// Renders a conditional `b:if` block in Blogger templates.
class BIf extends DomComponent {
  final String cond;

  @override
  String get tag => 'b:if';

  BIf({required this.cond, Iterable<Component>? children})
    : super(children, attributes: {'cond': cond});
}

/// Renders a conditional `b:elseif` branch inside a `b:if` block.
class BElseIf extends DomComponent {
  final String cond;

  @override
  String get tag => 'b:elseif';

  BElseIf({required this.cond}) : super(null, attributes: {'cond': cond});

  @override
  Iterable<Component> build() => [];
}

/// Renders an `b:else` branch for conditional template logic.
class BElse extends DomComponent {
  @override
  String get tag => 'b:else';

  const BElse() : super(null);

  @override
  Iterable<Component> build() => [];
}

/// Defines a `b:arg` attribute with either a static or expression value.
class BArg extends DomComponent {
  final String name;
  final String? value;
  final String? exprValue;

  @override
  String get tag => 'b:arg';

  BArg({required this.name, this.value, this.exprValue})
    : assert(
        value != null || exprValue != null,
        'BArg requires either value or exprValue to be provided.',
      ),
      super(
        null,
        attributes: {
          'name': name,
          if (exprValue != null)
            'expr:value': exprValue
          else if (value != null && value.isNotEmpty)
            'value': value,
        },
      );

  factory BArg.expr({required String name, required String exprValue}) {
    return BArg(name: name, exprValue: exprValue);
  }

  @override
  Iterable<Component> build() => [];
}

/// Renders a Blogger loop block using `b:loop`.
class BLoop extends DomComponent {
  final String values;
  final String varName;
  final String? index;

  @override
  String get tag => 'b:loop';

  BLoop({
    required this.values,
    required this.varName,
    this.index,
    Iterable<Component>? children,
  }) : super(
         children,
         attributes: {'values': values, 'var': varName, 'index': ?index},
       );
}

/// Writes a Blogger `data:` node with the provided value.
class BData extends DomComponent {
  final String value;

  @override
  String get tag => 'data:$value';

  const BData({required this.value}) : super(null);

  @override
  Iterable<Component> build() => [];
}

/// Builds a Blogger template skin block with optional CSS variables.
class BSkin extends Component {
  final Iterable<dynamic>? variables;
  final String version;
  final bool? contentInCDATA;
  final String? css;

  const BSkin(
    this.css, {
    this.variables,
    this.version = '1.3.3',
    this.contentInCDATA = true,
  });

  @override
  Iterable<Component> build() {
    var sb = StringBuffer();
    if (variables != null && variables!.isNotEmpty) {
      sb.writeln(" /*");
      sb.writeln(" <!-- Variable definitions -->");
      for (var v in variables!) {
        sb.writeln(v.toString());
      }
      sb.writeln(" */");
    }
    sb.write(css);

    var content = sb.toString();

    return [
      Text("\n"),
      XmlComment('prettier-ignore'),
      Text("\n"),
      CustomDomComponent(
        'b:skin',
        attributes: {'version': version},
        children: [
          if (contentInCDATA == true)
            RawText('<![CDATA[\n$content\n]]>')
          else
            Text(content),
        ],
      ),
      Text("\n"),
    ];
  }
}

/// Includes a Blogger template fragment by name.
class BInclude extends DomComponent {
  final String name;
  final String? data;
  final String? cond;

  @override
  String get tag => 'b:include';

  BInclude({required this.name, this.data, this.cond})
    : super(null, attributes: {'name': name, 'data': ?data, 'cond': ?cond});
}

/// Defines a named includable fragment for later use.
class BIncludable extends DomComponent {
  final String id;
  final String? varName;

  @override
  String get tag => 'b:includable';

  BIncludable({required this.id, this.varName, Iterable<Component>? children})
    : super(children, attributes: {'id': id, 'var': ?varName});
}

/// Adds a conditional attribute entry using Blogger's `b:attr` tag.
class BAttr extends DomComponent {
  final String? cond;
  final String name;
  final String? value;
  final String? exprValue;

  @override
  String get tag => 'b:attr';

  BAttr({required this.name, this.value, this.exprValue, this.cond})
    : super(
        null,
        attributes: {
          'name': name,
          if (exprValue != null)
            'expr:value': exprValue
          else if ((value ?? name).isNotEmpty)
            'value': value ?? name,
          'cond': ?cond,
        },
      );

  factory BAttr.expr({
    required String name,
    required String exprValue,
    String? cond,
  }) {
    return BAttr(name: name, exprValue: exprValue, cond: cond);
  }

  @override
  Iterable<Component> build() => [];
}

/// Adds a conditional CSS class via Blogger's `b:class` tag.
class BClass extends DomComponent {
  final String? name;
  final String? exprName;
  final String? cond;

  @override
  String get tag => 'b:class';

  BClass({this.name, this.exprName, this.cond})
    : assert(
        name != null || exprName != null,
        'BClass requires either name or exprName to be provided.',
      ),
      super(
        null,
        attributes: {
          if (exprName != null)
            'expr:name': exprName
          else if (name != null && name.isNotEmpty)
            'name': name,
          'cond': ?cond,
        },
      );

  factory BClass.expr(String exprName, {String? cond}) {
    return BClass(exprName: exprName, cond: cond);
  }

  @override
  Iterable<Component> build() => [];
}

/// Creates a dynamic HTML tag using Blogger template helper syntax.
class BTag extends DomComponent {
  final String? name;
  final String? cond;

  @override
  String get tag => 'b:tag';

  BTag({
    this.name,
    Map<String, String>? attributes,
    this.cond,
    Iterable<Component>? children,
  }) : super(
         children,
         attributes: {'name': ?name, ...?attributes, 'cond': ?cond},
       );
}

/// Evaluates an expression and renders the result in the template.
class BEval extends DomComponent {
  final String expr;

  @override
  String get tag => 'b:eval';

  BEval({required this.expr}) : super(null, attributes: {'expr': expr});

  @override
  Iterable<Component> build() => [];
}

/// Sets a local variable using Blogger's `b:with` helper.
class BWith extends DomComponent {
  final String varName;
  final String value;

  @override
  String get tag => 'b:with';

  BWith({
    required this.varName,
    required this.value,
    Iterable<Component>? children,
  }) : super(children, attributes: {'var': varName, 'value': value});
}

/// Renders a Blogger switch block.
class BSwitch extends DomComponent {
  final String varName;

  @override
  String get tag => 'b:switch';

  BSwitch({required this.varName, Iterable<Component>? children})
    : super(children, attributes: {'var': varName});
}

/// Creates a case branch inside a Blogger `b:switch` block.
class BCase extends DomComponent {
  final String value;

  @override
  String get tag => 'b:case';

  BCase({required this.value}) : super(null, attributes: {'value': value});

  @override
  Iterable<Component> build() => [];
}

/// Represents the default branch of a `b:switch` block.
class BDefault extends DomComponent {
  @override
  String get tag => 'b:default';

  const BDefault([super.children]);
}

/// Defines a translatable Blogger message block.
class BMessage extends DomComponent {
  final String name;

  @override
  String get tag => 'b:message';

  BMessage({required this.name, Iterable<Component>? children})
    : super(children, attributes: {'name': name});
}

/// Describes a template variable for Blogger skin or configuration metadata.
class BVariable {
  final String name;
  final String description;
  final String type;
  final String defaultValue;
  final String? value;

  const BVariable({
    required this.name,
    required this.description,
    required this.type,
    required this.defaultValue,
    this.value,
  });

  @override
  String toString() {
    return " <Variable name=\"$name\" description=\"$description\" type=\"$type\" default=\"$defaultValue\"${value != null ? " value=\"$value\"" : ""}/>";
  }
}

/// Groups multiple [BVariable] definitions for use in a Blogger skin.
class BGroup {
  final String description;
  final String? selector;
  final Iterable<BVariable> variables;

  const BGroup({
    required this.description,
    this.selector,
    required this.variables,
  });

  @override
  String toString() {
    var sb = StringBuffer();
    sb.writeln(
      " <Group description=\"$description\"${selector != null ? " selector=\"$selector\"" : ""}>",
    );
    for (var v in variables) {
      sb.writeln(v.toString());
    }
    sb.write(" </Group>");
    return sb.toString();
  }
}

/// Emits a Blogger comment node.
class BComment extends DomComponent {
  @override
  String get tag => 'b:comment';

  const BComment([super.children]);
}

/// Emits a raw XML comment in the rendered output.
class XmlComment extends Component {
  final String text;

  const XmlComment(this.text);

  @override
  Iterable<Component> build() => [RawText('<!-- $text -->')];
}

/// Wraps raw CSS content in a Blogger `b:template-skin` block.
class BTemplateSkin extends Component {
  final String content;
  final bool? contentInCDATA;
  final Map<String, String>? attributes;

  const BTemplateSkin(
    this.content, {
    this.contentInCDATA = true,
    this.attributes,
  });

  @override
  Iterable<Component> build() => [
    Text("\n"),
    XmlComment('prettier-ignore'),
    Text("\n"),
    CustomDomComponent(
      'b:template-skin',
      children: [
        if (contentInCDATA == true) RawText('<![CDATA[\n'),
        Text(content, escape: !contentInCDATA!),
        if (contentInCDATA == true) RawText('\n]]>'),
      ],
      attributes: attributes,
    ),
    Text("\n"),
  ];
}

/// Declares a Blogger template script dependency.
class BTemplateScript extends DomComponent {
  final String name;
  final String version;
  final bool? async;

  @override
  String get tag => 'b:template-script';

  BTemplateScript({required this.name, required this.version, this.async})
    : super(
        null,
        attributes: {
          'name': name,
          'version': version,
          'async': ?async?.toString(),
        },
      );

  @override
  Iterable<Component> build() => [];
}

/// Represents a named or expression parameter for template helpers.
class BParam extends DomComponent {
  final String? value;
  final String? exprValue;

  @override
  String get tag => 'b:param';

  BParam({this.value, this.exprValue})
    : assert(
        value != null || exprValue != null,
        'BParam requires either value or exprValue to be provided.',
      ),
      super(
        null,
        attributes: {
          if (exprValue != null)
            'expr:value': exprValue
          else if (value != null && value.isNotEmpty)
            'value': value,
        },
      );

  factory BParam.expr(String exprValue) {
    return BParam(exprValue: exprValue);
  }

  @override
  Iterable<Component> build() => [];
}

/// Declares a default markup type within the Blogger template.
class BDefaultMarkup extends DomComponent {
  final String type;

  @override
  String get tag => 'b:defaultmarkup';

  BDefaultMarkup({required this.type, Iterable<Component>? children})
    : super(children, attributes: {'type': type});
}

/// Container for multiple default markup declarations.
class BDefaultMarkups extends DomComponent {
  @override
  String get tag => 'b:defaultmarkups';

  const BDefaultMarkups([super.children]);
}
