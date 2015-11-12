@TestOn('browser')
@HtmlImport('default_validator_test.html')
library bwu_bind_html.test;

import 'dart:html' as dom;
import 'dart:async' show Future;
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:test/test.dart';
import 'package:bwu_bind_html/bwu_bind_html.dart';
import 'default_validator_test_element.dart';

// Silence analyzer [TestElement]
main() async {
  BwuBindHtml.defaultValidator = new dom.NodeValidatorBuilder.common()
    ..allowElement('bwu-bind-html',
        attributes: ['id', 'html', 'use-light-dom']);

  await initPolymer();

  test('standard element is added with default validator', () {
    BwuBindHtml bindHtml =
        dom.querySelector('#standardElementWithDefaultValidator');
    var html = new PolymerDom(bindHtml).childNodes;
    expect(html[0], new isInstanceOf<dom.DivElement>());
  });

  test('custom element is added with default validator', () {
    BwuBindHtml bindHtml =
        dom.querySelector('#customElementWithDefaultValidator');
    var staticHtml = new PolymerDom(bindHtml).childNodes;
    expect(staticHtml[0], new isInstanceOf<BwuBindHtml>());
    expect((staticHtml[0] as BwuBindHtml).id, 'customElementWithValidator');
    var dynamicHtml = new PolymerDom(staticHtml[0]).childNodes;
    expect(dynamicHtml[0].text, 'xxx');
    expect(dynamicHtml[1], new isInstanceOf<dom.BRElement>());
    expect(dynamicHtml[2].text, 'yyy');
  });
}
