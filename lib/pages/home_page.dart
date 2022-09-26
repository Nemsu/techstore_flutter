import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techstore_flutter/core/store.dart';
import 'package:techstore_flutter/models/cart.dart';
import 'dart:convert';
import 'package:techstore_flutter/models/catalog.dart';
import 'package:techstore_flutter/utils/routes.dart';
import 'package:techstore_flutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //đường dẫn file của flutter
  final url = "";
  
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = 
      await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
      .map<Item>((item) => Item.fromMap(item))
      .toList();
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation,RemoveMutation},
          builder: (ctx,_,__) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: MyTheme.darkBluishColor,
            child: const Icon(CupertinoIcons.cart),
          ).badge(
              color: Vx.red500 ,
              size: 22,
              count: _cart.items.length,
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
          )),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py8().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        )
    );
  }
}
