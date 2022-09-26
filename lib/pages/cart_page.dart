import 'package:flutter/material.dart';
import 'package:techstore_flutter/core/store.dart';
import 'package:techstore_flutter/models/cart.dart';
import 'package:techstore_flutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';



class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, _, __){
              return "\$${_cart.totalPrice}".text.xl5.color(MyTheme.darkBluishColor).make();
            }, 
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet".text.make(),
              ));
            },
            style: ButtonStyle(
              backgroundColor: 
                MaterialStateProperty.all(MyTheme.darkBluishColor)
            ),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}


class _CartList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final MyStore store = VxState.store;
    // VxState.listen(context,to : [AddMutation]);
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    
    return _cart.items.isEmpty?
     "Mothing to show".text.xl3.makeCentered() 
     : ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context,index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () => RemoveMutation(_cart.items[index]),
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}