import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:huu_loc63130680_flutter/commercial_app/controller.dart';
import 'package:huu_loc63130680_flutter/commercial_app/models.dart';
import 'package:badges/badges.dart' as badges;

class PageChiTietSP extends StatelessWidget {
  PageChiTietSP({required this.sp,super.key});
  Fruit sp;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width*0.9;
    double r;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(sp.ten),
        actions: [
          GioHang_Widget()
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: w,
                child: Image.network(sp.url!),
              ),
            ),
            Text(sp.ten),
            Text("${sp.gia} vnd",style: TextStyle(color: Colors.red),),
            Text("${sp.mota}"),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: r = Random().nextInt(21)/10.0+3,
                  minRating: 1,
                  maxRating: 5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Text("${r}",style: TextStyle(color: Colors.red),),
                Text(" "),
                Text("${Random().nextInt(100)} Đánh giá"),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_shopping_cart,color: Colors.red,),
          onPressed: () {
            SimpleControllerSP.get().themVaoGH(sp,
                updateWidgetIds: ["gioHang"],
                function:(slSP){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Đã có ${slSP} ${sp.ten} trong giỏ hàng")
                      )
                  );
                },
            );
          },
      ),
    );
  }
}

class GioHang_Widget extends StatelessWidget {
  const GioHang_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SimpleControllerSP>(
      init: SimpleControllerSP.get(),
      id: "gioHang",
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: badges.Badge(
          showBadge: controller.slMHTrongGH>0,
          child: Icon(Icons.shopping_cart_outlined),
          badgeContent: Text("${controller.slMHTrongGH}",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
