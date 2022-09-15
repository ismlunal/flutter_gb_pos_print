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
                GBPosPrint.qrArea("ismailunal.net");

                /*
                GBPosPrint.startPrint(
                    "GAZIBEL HIZ MUS INS SAN TIC A.S.\nGAZIBEL MARKET (GAZIMAR)");
                GBPosPrint.spacePrint(3);
                GBPosPrint.startPrint("TERMINAL NO: 00001");
                GBPosPrint.spacePrint(2);
                GBPosPrint.startPrint("10.05.2021 18:24:24");
                GBPosPrint.spacePrint(5);
                GBPosPrint.startPrint("-------- SATIS ISLEMI --------");
                GBPosPrint.spacePrint(3);
                GBPosPrint.startPrint("ISLEM NO: 00001");
                GBPosPrint.spacePrint(1);
                GBPosPrint.startPrint("KART NO: 1234 **** **** 1234");
                GBPosPrint.spacePrint(4);
                GBPosPrint.startPrint("RET KODU: C001");
                GBPosPrint.spacePrint(2);
                GBPosPrint.startPrint("BAKIYE YETERSIZ");

                GBPosPrint.spacePrint(6);
                GBPosPrint.startPrint("Belge bilgi amacli verilmistir");
                GBPosPrint.spacePrint(1);
                GBPosPrint.endLogo();

                GBPosPrint.spacePrint(18);
                */
              },
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
