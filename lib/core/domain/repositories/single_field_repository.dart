import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

abstract class SingleFieldRepository<T> {
  final BehaviorSubject<T?> _valueRx = BehaviorSubject();

  SingleFieldRepository() {
    _valueRx.add(get());
  }

  @protected
  Future<void> storeValue(T value);

  @protected
  Future<void> clearValue();

  Future<void> set(T value) async {
    await storeValue(value);
    _valueRx.add(value);
  }

  T? get();

  ValueStream<T?> get stream => _valueRx.stream;

  Future<void> clear() async {
    await clearValue();
    _valueRx.add(null);
  }

  bool get has => get() != null;
}
