library bwu_bind_html.tool.grind;

export 'package:bwu_grinder_tasks/bwu_grinder_tasks.dart' hide main;
import 'package:bwu_grinder_tasks/bwu_grinder_tasks.dart'
    show grind, analyzerIgnoreInfoMessages;

void main(List<String> args) {
  // TODO(zoech) remove when deprecated `analyzer_task` and `dartformat_task` are removed
  analyzerIgnoreInfoMessages = true;
  grind(args);
}
