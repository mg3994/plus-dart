import 'package:dom/dom.dart';

final Component plusUiTemplate = Fragment([
  const RawText('<?xml version="1.0" encoding="UTF-8" ?>\n<!DOCTYPE html>\n'),
  html(
    [
      BAttr(name: 'xmlns', value: ''),
      BAttr(name: 'xmlns:b', value: ''),
      BAttr(name: 'xmlns:expr', value: ''),
      BAttr(name: 'xmlns:data', value: ''),
      BWith(
        varName: 'is_amp',
        value: 'data:view.isPost',
        children: [
          CustomDomComponent(
            'head',
            children: [
              const title([BData(value: 'view.title.escaped')]),
              BInclude(name: 'all-head-content', data: 'blog'),
              const XmlComment(' Conditional Scripts Loading '),
              BIf(
                cond: 'data:is_amp == "true"',
                children: const [
                  meta(attributes: {'charset': 'utf-8'}),
                  meta(
                    attributes: {
                      'content':
                          'width=device-width,minimum-scale=1,initial-scale=1',
                      'name': 'viewport',
                    },
                  ),
                  script(
                    null,
                    attributes: {
                      'async': 'async',
                      'src': 'https://cdn.ampproject.org/v0.js',
                    },
                  ),
                ],
              ),
              BElse(),
              const script(
                [
                  RawText(
                    '//<![CDATA[\nconsole.log("Loading standard dynamic JavaScript...");\n//]]>',
                  ),
                ],
                attributes: {'type': 'text/javascript'},
              ),
              BIf(
                cond: 'false',
                children: const [BSkin('/* CSS Styles go here */')],
              ),
              BIf(
                cond: 'data:is_amp == "true"',
                children: const [RawText('&lt;!--<head/>--&gt;')],
              ),
            ],
          ),
          body([
            BSection(
              className: 'm-20 c-yellow   bg-primary text-white bg-gray-200 text-gray-500',
              id: 'main',
              showaddelement: false,
              children: [
                BWidget(
                  id: 'Blog1',
                  locked: true,
                  title: 'Blog Posts',
                  type: 'Blog',
                  version: 2,
                  children: [
                    BIncludable(
                      id: 'main',
                      children: [
                        BIf(
                          cond: 'data:view.isPost',
                          children: [
                            BLoop(
                              values: 'data:posts',
                              varName: 'post',
                              children: [
                                BInclude(
                                  name: 'post-metadataJSON',
                                  data: 'post',
                                ),
                                BIf(
                                  cond: 'data:post.body not contains "</head><body>"',
                                  children: const [
                                    RawText('&lt;/head&gt;&lt;body&gt;'),
                                  ],
                                ),
                                BIf(
                                  cond: 'data:post.body not contains "<amp-story"',
                                  children: const [
                                    Component.text(
                                      'The post body must contain ',
                                    ),
                                    code([Component.text('&lt;amp-story&gt;')]),
                                    Component.text(' tag.'),
                                  ],
                                ),
                                BElseIf(
                                  cond: 'data:post.body not contains "<amp-story-page"',
                                ),
                                const Component.text(
                                  'The post body must contain at least one ',
                                ),
                                const code([
                                  Component.text('&lt;amp-story-page&gt;'),
                                ]),
                                const Component.text(' tag in '),
                                const code([
                                  Component.text('&lt;amp-story&gt;'),
                                ]),
                                const Component.text('.'),
                                BElse(),
                                const BData(value: 'post.body'),
                              ],
                            ),
                          ],
                        ),
                        BElse(),
                        const h1(
                          [Component.text('AMP / Non-AMP Tricking System')],
                          attributes: {'class': "m-1"},
                        ),
                        const p([
                          Component.text(
                            'Template updated cleanly without trailing artifacts.',
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            BIf(
              cond: 'data:is_amp == "true"',
              children: const [
                RawText(
                  "&lt;textarea id='template_widgets_js' disabled readonly hidden aria-hidden='true' class='notranslate'&gt;",
                ),
              ],
            ),
          ]),
          BIf(
            cond: 'data:is_amp == "true"',
            children: const [RawText('&lt;/textarea&gt;')],
          ),
          const RawText('&lt;/body&gt;'),
          const BComment([
            RawText(
              '<!--[ </document> | <!> Do not modify anything below ]-->',
            ),
          ]),
        ],
      ),
    ],
    attributes: const {
      'b:css': 'false',
      'b:defaultwidgetversion': '2',
      'b:layoutsVersion': '3',
      'b:responsive': 'true',
      'b:templateUrl': 'plus-ui.xml',
      'b:templateVersion': '3.7.0',
      'xmlns': 'http://www.w3.org/1999/xhtml',
      'xmlns:b': 'http://www.google.com/2005/gml/b',
      'xmlns:data': 'http://www.google.com/2005/gml/data',
      'xmlns:expr': 'http://www.google.com/2005/gml/expr',
    },
  ),
]);

void main(List<String> args) {
  print(plusUiTemplate.render());
}
