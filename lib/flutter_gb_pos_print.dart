
import 'dart:async';

import 'package:flutter/services.dart';

class GBPosPrint {
  static const MethodChannel _channel = MethodChannel('flutter_gb_pos_print');

  static Future<void> startPrint(String content) async {
    await _channel.invokeMethod('startPrint', {
      "content": content
    });
  }

  static Future<void> spacePrint(int line) async {
    await _channel.invokeMethod('spacePrint', {
      "line": line
    });
  }

  static Future<void> endLogo() async {
    await _channel.invokeMethod('endLogo');
  }

}
