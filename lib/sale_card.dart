import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'env.dart';
import 'helper/counter.dart';

int _defaultValue = 1;

class SaleItemCard extends StatefulWidget {
  final DocumentSnapshot item;
  const SaleItemCard({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  _SaleItemCardState createState() => _SaleItemCardState();
}

class _SaleItemCardState extends State<SaleItemCard> {
  int priceItem = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      priceItem = widget.item.data['sale price'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 64.0, 0.0, 64.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(128.0, 0.0, 128.0, 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        AutoSizeText(
                          widget.item.data['name'],
                          minFontSize: 32.0,
                          maxFontSize: 256.0,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: AutoSizeText(
                            widget.item.data['category'],
                            minFontSize: 24.0,
                            maxFontSize: 256.0,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CounterPlugin(
                            initialValue: _defaultValue,
                            minValue: 1,
                            maxValue: widget.item.data['in stock'],
                            step: 1,
                            buttonSize: 32.0,
                            decimalPlaces: 3,
                            onChanged: (value) {
                              setState(() {
                                _defaultValue = value;
                                priceItem =
                                    value * widget.item.data['sale price'];
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AutoSizeText(
                                '\$',
                                minFontSize: 24.0,
                                maxFontSize: 256.0,
                                style: TextStyle(color: Colors.redAccent),
                              ),
                              AutoSizeText(
                                priceItem.toString(),
                                minFontSize: 64.0,
                                maxFontSize: 256.0,
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            elevation: 5.0,
            child: Image.network(
              widget.item.data['image'],
              height: Environment().getHeight(height: 12.0),
              width: Environment().getWidth(width: 10.0),
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(200.0, 8.0, 200.0, 36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  elevation: 11.0,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AutoSizeText(
                          'Delete',
                          minFontSize: 24.0,
                          maxFontSize: 256.0,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Icon(
                        Icons.delete,
                        size: 32.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
