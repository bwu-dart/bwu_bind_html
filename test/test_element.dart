@HtmlImport('test_element.html')
library bwu_bind_html.test.test_element;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:bwu_bind_html/bwu_bind_html.dart';

/// Silence analyzer [BwuBindHtml]
@PolymerRegister('test-element')
class TestElement extends PolymerElement {
  TestElement.created() : super.created();

  @property final String simpleHtml = 'xxx<br>yyy';
}
