import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import 'add_service_screen.dart';
import 'dialog/receipt_dialog.dart';
import 'functions/database.dart';
import 'helper/search_library.dart';
import 'item_sale.dart';
import 'sale_card.dart';
import 'service_card.dart';
import 'themes/helpers/theme_colors.dart';

class ListTotal extends StatefulWidget {
  const ListTotal({
    Key key,
  }) : super(key: key);

  @override
  _ListTotalState createState() => _ListTotalState();
}

List<Widget> addService = [];

class _ListTotalState extends State<ListTotal> {
  List<Widget> cardItem = addService;

  TextEditingController _barcode = TextEditingController();
  String _name = 'No one';
  FocusNode _textFocus = new FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _barcode.dispose();
    _textFocus.dispose();
  }

  _buildMaterialSearchPage(
      BuildContext context, List<DocumentSnapshot> documents) {
    return new MaterialPageRoute<String>(
        settings: RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {
          return StreamBuilder<QuerySnapshot>(
              stream: Database().getStreamCollection(
                collection: 'products',
                orderBy: 'name',
                isDescending: false,
              ),
              builder: (context, snapshot) {
                return Material(
                  child: MaterialSearch<String>(
                    placeholder: 'Search',
                    results: documents
                        .map((DocumentSnapshot v) =>
                            MaterialSearchResult<String>(
                              imageSrc: v.data['image'],
                              value: v,
                              text: ReCase(v.data['name']).titleCase,
                            ))
                        .toList(),
                    filter: (DocumentSnapshot value, String criteria) {
                      return value.data['name'].toLowerCase().trim().contains(
                          RegExp(r'' + criteria.toLowerCase().trim() + ''));
                    },
                    // onSelect: (DocumentSnapshot value) {
                    //   cardItem.add(SaleItemCard(item: value));
                    //   Navigator.of(context, rootNavigator: true).pop();
                    // },
                    onSubmit: (String value) =>
                        Navigator.of(context).pop(value),
                  ),
                );
              });
        });
  }

  _showMaterialSearch(BuildContext context, List<DocumentSnapshot> documents) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context, documents))
        .then((dynamic value) {
      setState(() => _name = value as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: pinkColor,
        title: AutoSizeText(
          'Sale and Service',
          minFontSize: 30.0,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              List<DocumentSnapshot> documents =
                  await Database().getAllCollection(
                collection: 'products',
                sortBy: 'name',
                order: false,
              );
              _showMaterialSearch(context, documents);
            },
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SaleItemCard(),
                  ServicePriceCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FloatingActionButton(
              backgroundColor: pinkColor,
              heroTag: 's1',
              elevation: 5.0,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return ReceiptDialog();
                    });
              },
              child: Icon(
                Icons.print,
                size: 24.0,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: FloatingActionButton(
                  backgroundColor: pinkColor,
                  heroTag: 's2',
                  elevation: 5.0,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => AddService(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.content_cut,
                    size: 24.0,
                  ),
                ),
              ),
              FloatingActionButton(
                backgroundColor: pinkColor,
                heroTag: 's3',
                elevation: 5.0,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => GridProductSale(),
                    ),
                  );
                },
                child: Icon(
                  Icons.add_shopping_cart,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
