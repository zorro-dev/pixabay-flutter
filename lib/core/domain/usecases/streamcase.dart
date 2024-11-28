import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class StreamCase<ReturnType, Params> {
  final _subscriptions = <StreamSubscription>[];

  void call(
      Params params, {
        void Function(ReturnType event)? onData,
        Function? onError,
        void Function()? onDone,
        bool? cancelOnError,
        bool shouldClearListeners = true,
      }) async {
    if (kDebugMode) {
      print("StreamCase $runtimeType");
    }

    if (shouldClearListeners) {
      await clearListeners();
    }

    final s = stream(params, _subscriptions);
    _subscriptions.add(s.listen(
      onData,
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    ));
  }

  @protected
  Stream<ReturnType> stream(Params params, List<StreamSubscription> subscriptions);

  Future<void> clearListeners() async {
    for (int i = 0; i < _subscriptions.length; i ++) {
      final element = _subscriptions[i];

      try {
        await element.cancel();
      } catch (_) {}
    }

    _subscriptions.clear();
  }

  Future<void> close() async {
    if (kDebugMode) {
      print("StreamCase close $runtimeType");
    }
    clearListeners();
  }
}
