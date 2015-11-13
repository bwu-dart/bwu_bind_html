@HtmlImport('default_validator_test_element.html')
library bwu_bind_html.test.default_validator_test_element;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:bwu_bind_html/bwu_bind_html.dart';

/// Silence analyzer [BwuBindHtml]
@PolymerRegister('default-validator-test-element')
class DefaultValidatorTestElement extends PolymerElement {
  DefaultValidatorTestElement.created() : super.created();

  @property final simpleHtml = 'xxx<br>yyy';

  @property final standardElement = '<div id="div"><div>';

  @property final customElement =
      '<bwu-bind-html id="customElementWithValidator" html="xxx<br>yyy" use-light-dom></bwu-bind-html>';
}
