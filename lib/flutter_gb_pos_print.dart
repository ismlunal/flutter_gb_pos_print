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
    bool footerLogo = false,
    String? footerCode,
    String? qrData,
    int qrWidth = 0,
    int qrHeight = 0,
    int qrAlignment = 110,
  }) async {
    if (qrData != null && qrWidth == 0) {
      if (qrData.length >= 300)
        qrWidth = 2;
      else if (qrData.length >= 140)
        qrWidth = 3;
      else if (qrData.length >= 50)
        qrWidth = 4;
      else if (qrData.length >= 20)
        qrWidth = 5;
      else
        qrWidth = 6;
    }

    await _channel.invokeMethod('fullContent', {
      "content": content,
      "footerLogo": footerLogo,
      "footerCode": (footerCode ?? "GBB"),
      "qrData": qrData,
      "qrWidth": qrWidth,
      "qrHeight": qrHeight,
      "qrAlignment": qrAlignment,
    });
  }
}
