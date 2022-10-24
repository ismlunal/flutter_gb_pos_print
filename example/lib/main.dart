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
                String companyName = "GAZİBEL AŞ";
                String userIDFormat = "00001";
                String allDate = "01.01.2022 02:00:00";
                String processIDFormat = "0001";
                String cardNoFormat = "000001";
                String balanceFormat = "125,65";

                String printText =
                    "GAZIBEL HIZ MUS INS SAN TIC A.S.\n${companyName}\n \nTERMINAL NO: ${userIDFormat}\n${allDate}\n \n------ BAKIYE SORGULAMA -------\n \nISLEM NO : ${processIDFormat}\nKART NO  : ${cardNoFormat}\nBAKIYE   : ${balanceFormat} TL\n \nBelge bilgi amacli verilmistir. \n \n";

                GBPosPrint.fullContent(
                  content: printText,
                  qrArea: "ismailunal.net",
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
