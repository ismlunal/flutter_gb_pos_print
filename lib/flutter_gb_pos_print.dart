import 'dart:async';

import 'package:flutter/services.dart';

class GBPosPrint {
  static const MethodChannel _channel = MethodChannel('flutter_gb_pos_print');

  static Future<void> startPrint(String content) async {
    await _channel.invokeMethod('startPrint', {"content": content});
  }

  static Future<void> spacePrint(int line) async {
    await _channel.invokeMethod('spacePrint', {"line": line});
  }

  static Future<void> endLogo() async {
    await _channel.invokeMethod('endLogo');
  }

  static Future<void> qrArea(String content) async {
    await _channel.invokeMethod('qrArea', {"content": content});
  }

  static Future<void> dataMatrixArea(String content) async {
    await _channel.invokeMethod('dataMatrixArea', {"content": content});
  }

  static Future<void> fullContent({
    required String content,
    String? qrArea,
    bool footerLogo = false,
  }) async {
    await _channel.invokeMethod('fullContent', {
      "content": content,
      "qrArea": qrArea,
      "footerLogo": footerLogo,
    });
  }
}
