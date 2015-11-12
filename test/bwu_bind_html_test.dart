@HtmlImport('bwu_bind_html_test.html')
library bwu_bind_html.test;

import 'dart:html' as dom;
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

  test('dynamically added bwu-bind-html', () {
    final bindHtml = new BwuBindHtml()..html = 'aaa<br>bbb';
    var html = new PolymerDom(bindHtml).childNodes;
    expect(html[0].text, 'aaa');
    expect(html[1], new isInstanceOf<dom.BRElement>());
    expect(html[2].text, 'bbb');
  });
}
