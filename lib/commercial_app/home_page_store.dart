import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huu_loc63130680_flutter/commercial_app/controller.dart';
import 'package:huu_loc63130680_flutter/commercial_app/page_chi_tiet.dart';
import 'package:badges/badges.dart' as badges;

class AppFruitStore extends StatelessWidget {
  const AppFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: FruitStoreBinding(),
      home: PageHomeFruitStore(),
    );
  }
}

class PageHomeFruitStore extends StatelessWidget {
  const PageHomeFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Store"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          GioHang_Widget()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GetBuilder<SimpleControllerSP>(
            init: SimpleControllerSP.get(),
            id: "listSP",
            builder: (controller) {
              return GridView.extent(
                maxCrossAxisExtent: 300,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children:controller.dssp.map(
                        (sp) => GestureDetector(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute
                            (builder: (context) => PageChiTietSP(sp: sp),)
                          ),
                          child: Card(
                            elevation: 0.5,
                            child: Column(
                              children: [
                                Expanded(
                                    child: sp.url!=null? Image.network(sp.url!) : Icon(Icons.image)
                                ),
                                Text(sp.ten),
                                Text("${sp.gia}",style: TextStyle(color:Colors.red),),
                              ],
                            ),
                          ),
                        )
                ).toList(),
              );
            },
        ),
      ),
    );
  }
}
