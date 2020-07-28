import 'package:evnspc_categories_support/base/base_event.dart';

class FailEvent extends BaseEvent {
  final String errMessage;
  FailEvent(this.errMessage);
}
