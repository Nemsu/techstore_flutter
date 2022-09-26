import 'package:flutter/material.dart';
import 'package:techstore_flutter/models/catalog.dart';
import 'package:techstore_flutter/widgets/home_widgets/add_to_cart.dart';
import 'package:techstore_flutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
  :assert(catalog != null);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(
              catalog: catalog,
            ).wh(120,50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                      .color(MyTheme.darkBluishColor)
                      .bold.make(),
                      catalog.desc.text
                      .textStyle(context.captionStyle).xl
                      .make(),
                      10.heightBox,
                      "Thông tin chi tiết sản phẩm có thể xem ở đây"
                      .text.textStyle(context.captionStyle).xl.make().p16()
                    ],
                  ).py64(),
                ),
              )
            )

          ],
        ),
      ),
    );
  }
}