// import 'elements/index.dart' as elements;
import 'components/index.dart' as components;
// import 'themes/index.dart' as themes;

class WidgetDemoList {
  WidgetDemoList();

  List getDemos() {
    List result = [];
    // result.addAll([]);
    result.addAll(components.getWidgets());
    // result.addAll([]);
    return result;
  }
}
