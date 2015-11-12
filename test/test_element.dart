@HtmlImport('test_element.html')
library bwu_bind_html.test.test_element;

import 'dart:html' as dom;
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:bwu_bind_html/bwu_bind_html.dart';

/// Silence analyzer [BwuBindHtml]
@PolymerRegister('test-element')
class TestElement extends PolymerElement {
  TestElement.created() : super.created();

  @property final html5Validator = new dom.NodeValidatorBuilder()..allowHtml5();

  @property final customValidator = new dom.NodeValidatorBuilder()
    ..allowElement('bwu-bind-html', attributes: ['id', 'html', 'use-light-dom']);

  @property final simpleHtml = 'xxx<br>yyy';

  @property final standardElement = '<div id="div"><div>';

  @property final customElement =
      '<bwu-bind-html id="customElementWithValidator" html="xxx<br>yyy" use-light-dom></bwu-bind-html>';
}
