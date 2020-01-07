import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import './flipper_plugin.dart';

class FlipperClient {
  static const MethodChannel _channel =
      const MethodChannel('flutter_flipperkit');

  static FlipperClient _flipperClient;
  static FlipperClient getDefault() {
    if (_flipperClient == null) {
      _flipperClient = new FlipperClient();
    }

    return _flipperClient;
  }

  Map<String, FlipperPlugin> _plugins;

  FlipperClient() {
    _plugins = new Map();
  }

  void addPlugin(FlipperPlugin plugin) async {
    if (Platform.isAndroid) {
      await _channel.invokeMethod('clientAddPlugin', {
        'id': plugin.getId(),
      });
      _plugins.putIfAbsent(plugin.getId(), () => plugin);
    }
  }

  FlipperPlugin getPlugin(String id) {
    if (_plugins.containsKey(id)) return _plugins[id];
    return null;
  }

  void start() async {
    if (Platform.isAndroid) {
      await _channel.invokeMethod('clientStart');
    }
  }

  void stop() async {
    if (Platform.isAndroid) {
      await _channel.invokeMethod('clientStop');
    }
  }
}
