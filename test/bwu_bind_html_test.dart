@HtmlImport('bwu_bind_html_test.html')
library bwu_bind_html.test;

import 'dart:html' as dom;
import 'dart:async' show Future;
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:test/test.dart';
import 'test_element.dart';
import 'package:bwu_bind_html/bwu_bind_html.dart';

main() async {
  await initPolymer();
  test('content added to *local* DOM using HTML binding', () {
    BwuBindHtml bindHtml = dom.querySelector('#simpleLocal');
    var html = new PolymerDom(bindHtml.root)
        .childNodes
        .where((node) => node is! dom.ContentElement)
        .toList();
    expect(html[0].text, 'xxx');
    expect(html[1], new isInstanceOf<dom.BRElement>());
    expect(html[2].text, 'yyy');
  });

  test('content added to *light* DOM using HTML binding', () {
    BwuBindHtml bindHtml = dom.querySelector('#simpleLight');
    var html = new PolymerDom(bindHtml).childNodes;
    expect(html[0].text, 'xxx');
    expect(html[1], new isInstanceOf<dom.BRElement>());
    expect(html[2].text, 'yyy');
  });

  test('standard element is removed with default validator', () {
    BwuBindHtml bindHtml = dom.querySelector('#customElement');
    var html = new PolymerDom(bindHtml).childNodes;
    expect(html, isEmpty);
  });

  test('standard element is added with bound HTML5 validator', () {
    BwuBindHtml bindHtml =
        dom.querySelector('#standardElementWithHtml5Validator');
    var html = new PolymerDom(bindHtml).childNodes;
    expect(html[0], new isInstanceOf<dom.DivElement>());
  });

  test('custom element is removed with default validator', () {
    BwuBindHtml bindHtml = dom.querySelector('#customElement');
    var html = new PolymerDom(bindHtml).childNodes;
    expect(html, isEmpty);
  });

  test('custom element is added with bound custom validator', () {
    BwuBindHtml bindHtml =
        dom.querySelector('#customElementWithCustomValidator');
    var staticHtml = new PolymerDom(bindHtml).childNodes;
    expect(staticHtml[0], new isInstanceOf<BwuBindHtml>());
    expect((staticHtml[0] as BwuBindHtml).id, 'customElementWithValidator');
    var dynamicHtml = new PolymerDom(staticHtml[0]).childNodes;
    expect(dynamicHtml[0].text, 'xxx');
    expect(dynamicHtml[1], new isInstanceOf<dom.BRElement>());
    expect(dynamicHtml[2].text, 'yyy');
  });

  test('dynamically added bwu-bind-html', () async {
    final bindHtml = new BwuBindHtml()
      ..attributes['use-light-dom'] = 'true'
      ..html = 'aaa<br>bbb';
    dom.document.body.append(bindHtml);
    await new Future(() {
      var html = new PolymerDom(bindHtml).childNodes;
      expect(html[0].text, 'aaa');
      expect(html[1], new isInstanceOf<dom.BRElement>());
      expect(html[2].text, 'bbb');
    });
  });
}
