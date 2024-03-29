import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'env.dart';

class ServicePriceCard extends StatefulWidget {
  // final DocumentSnapshot documentService;
  // final DocumentSnapshot documentEmployee;
  const ServicePriceCard({
    Key key,
    // @required this.documentService,
    // @required this.documentEmployee,
  }) : super(key: key);

  // final DocumentSnapshot documentEmployee;
  // final DocumentSnapshot documentService;

  @override
  _ServicePriceCardState createState() => _ServicePriceCardState();
}

class _ServicePriceCardState extends State<ServicePriceCard> {
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
                    padding:
                        const EdgeInsets.fromLTRB(128.0, 170.0, 128.0, 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        AutoSizeText(
                          // widget.productDocument.data['name'],
                          'Services Name',
                          minFontSize: 36.0,
                          maxFontSize: 256.0,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeText(
                                  // widget.productDocument.data['name'],
                                  'By',
                                  minFontSize: 24.0,
                                  maxFontSize: 256.0,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              AutoSizeText(
                                // '${widget.documentEmployee.data['last name']} ${widget.documentEmployee.data['first name']}',
                                'Staff Name',
                                minFontSize: 24.0,
                                maxFontSize: 256.0,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AutoSizeText(
                                '\$',
                                minFontSize: 32.0,
                                maxFontSize: 256.0,
                                style: TextStyle(color: Colors.redAccent),
                              ),
                              AutoSizeText(
                                // widget.documentService.data['price'].toString(),
                                '200',
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
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              child: Image.network(
                'https://sleepmatters.ie/wp-content/uploads/2018/05/Child-Bath-Every-Night.jpg',
                height: Environment().getHeight(height: 16.0),
                width: Environment().getWidth(width: 12.0),
                fit: BoxFit.fitHeight,
                scale: 30.0,
              ),
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
