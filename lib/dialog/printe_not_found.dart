import 'package:flutter/material.dart';
import 'package:store_transaction/themes/helpers/fonts.dart';
import 'package:store_transaction/themes/helpers/theme_colors.dart';

import '../env.dart';

class PrinterNotFoundDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      contentPadding:
          const EdgeInsets.only(top: 40.0, right: 40, left: 40, bottom: 0.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: SingleChildScrollView(
        child: Container(
          width: Environment().getWidth(width: 13),
          height: Environment().getHeight(height: 13),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.print,
                    color: removeColor,
                    size: 70.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Printer Not Found!",
                      style: TextStyle(fontSize: 25, fontFamily: 'Avenir'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Text(
                      "Please connect your printer",
                      style: font20Grey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
