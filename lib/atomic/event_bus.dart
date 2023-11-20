import 'dart:html';

typedef void EventCallback(arg);
class EventBus {
  //私有构造函数
  EventBus._internal();
  //保存单例
  static EventBus _singleton = EventBus._internal();
  factory EventBus() => _singleton;
  final _emap = Map<Object,List<EventCallback>?>();
  //添加订阅
  void on(eventName,EventCallback f) {
    _emap[eventName] ??= <EventCallback>[];
    _emap[eventName]!.add(f);
  }
  void remove(eventName,[EventCallback? f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

}