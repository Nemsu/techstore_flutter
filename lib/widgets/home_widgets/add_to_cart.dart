import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techstore_flutter/core/store.dart';
import 'package:techstore_flutter/models/cart.dart';
import 'package:techstore_flutter/models/catalog.dart';
import 'package:techstore_flutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    Key? key, required this.catalog,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final MyStore store = VxState.store;
    // VxState.listen(context,to : [AddMutation]);
   VxState.watch(context, on: [AddMutation,RemoveMutation]);
    
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: (){
        if(!isInCart){
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          MyTheme.darkBluishColor
          ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        )),
      child:
       isInCart ? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}