# &lt;bwu-bind-html&gt;
A Dart Polymer 1.0 element for binding text containing HTML

## Usage

The parent element has a property that provides some HTML string like:

```dart
@property String someHtml = '<div>some text</div>';
```

and in it's template this string can be bound like:

```html
<bwu-bind-html html="[[someHtml]]"></bwu-bind-html>
```

## Options
 
### Attributes
 
The element can be configured using the following attributes
- `html` (type `String`) takes the HTML string to be added to the DOM 
(default `''`) 
- `use-light-dom` (type `bool`) adds the HTML to `<bwu-bind-html>`s light DOM
 instead of the shady or shadow DOM (default) to make it easier to style the 
 added HTML from the outside.
- `validator` (type `NodeValidator`) allows to bind a validator that defines which 
 HTML elements and attributes are allowed (default 
 `new NodeValidatorBuilder()..allowTextElements();`). 
- `treeSanitizer` (type `NodeTreeSanitizer`) allows to bind a tree sanitizer 
(default `null`).

### Application-wide default validator 

`BwuBindHtml` allows to change the **default** `validator`
 and `treeSanitizer` which affects all instances of `<bwu-bind-html>` with no
 specific validator or treeSanitizer is bound to.
  
Change the defaults by assigning a `validator` or `treeSanitizer` instance to 
the static fields `BwuBindHtml.defaultValidator` or 
`BwuBindHtml.defaultTreeSanitizer`.

Note 
   
For examples see the [unit tests](https://github.com/bwu-dart/bwu_bind_html/blob/master/test/test_element.html)    

