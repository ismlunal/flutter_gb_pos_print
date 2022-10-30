import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_gb_pos_print/flutter_gb_pos_print.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              child: const Text(
                "Test Print",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () async {
                String printText =
                    "GAZIBEL HIZ MUS INS SAN TIC A.S.\nHAYDI\n\nTERMINAL NO: 000111\n24.10.2022 17:02:10\n\n-------- SATIS ISLEMI --------\n\nISLEM NO : 0069477\nONAY NO  : 0000360\nTUTAR    : 3,00 TL \n \r \n";
                String? qrData = "ismailunal.net";

                GBPosPrint.fullContent(
                  content: printText,
                  qrData: qrData,
                  footerLogo: true,
                );
              },
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
