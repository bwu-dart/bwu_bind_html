@HtmlImport('bwu_bind_html.html')
library bwu_bind_html;

import 'dart:html' as dom;
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';

@PolymerRegister('bwu-bind-html')
class BwuBindHtml extends PolymerElement {
  factory BwuBindHtml() => new dom.Element.tag('bwu-bind-html') as BwuBindHtml;

  BwuBindHtml.created() : super.created();

  static dom.NodeValidator defaultValidator = new dom.NodeValidatorBuilder()
    ..allowTextElements();

  static dom.NodeTreeSanitizer defaultTreeSanitizer;

  @Property(observer: 'updateHtml') String html;

  @Property(observer: 'updateHtml') bool useLightDom = false;

  @Property(observer: 'updateHtml') dom.NodeValidator validator;

  @Property(observer: 'updateHtml') dom.NodeTreeSanitizer treeSanitizer;

  @reflectable
  void updateHtml(_, [__]) {
    this.debounce('updateHtml', () {
      final PolymerDom lightDom = new PolymerDom(this);
      lightDom.childNodes.toList().forEach(lightDom.removeChild);
      final PolymerDom shadyDom = new PolymerDom(this.root);
      shadyDom.childNodes
          .where((e) => e is! dom.ContentElement)
          .toList()
          .forEach(shadyDom.removeChild);

      if (html != null && html.isNotEmpty) {
        final fragment = new dom.DocumentFragment.html(html,
            validator: validator ?? defaultValidator,
            treeSanitizer: treeSanitizer ?? defaultTreeSanitizer);

        if (useLightDom) {
          lightDom.append(fragment);
        } else {
          shadyDom.append(fragment);
        }
      }
    });
  }
}
