import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huu_loc63130680_flutter/commercial_app/firebase_controller.dart';
import 'package:huu_loc63130680_flutter/commercial_app/page_chi_tiet.dart';
import 'package:huu_loc63130680_flutter/widget_connect_firebase.dart';

class AppFruitStoreFireBase extends StatelessWidget {
  const AppFruitStoreFireBase({super.key});

  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(
      connectingMessage: "Đang tải...",
      errorMessage: "Có lỗi xảy ra",
      builder:(context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: FirebaseControllerBindings(),
        home: HomePageFruitStore(),
      ),
    );
  }
}
class HomePageFruitStore extends StatelessWidget {
  const HomePageFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Store FireBase"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          GioHang_Widget2(),
        ],
      ),
      body:GetX<FirebaseController>(
        init: FirebaseController.instance,
        builder: (controller) {
          var list = controller.dssp;
          return GridView.extent(
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: list.map(
                    (fruitsnap) {
                  var sp = fruitsnap.fruit;
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute
                      (builder: (context) => PageChiTietSPFirebase(sp: sp),)
                    ),
                    child: Card(
                      elevation: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child:sp.image!=null?Image.network(sp.image!):
                            Icon(Icons.error),
                          ),
                          Text(sp.ten,style: TextStyle(fontSize: 20,color: Colors.blue)),
                          Text("${sp.gia}",style: TextStyle(fontSize: 20,color: Colors.red)),
                        ],
                      ),
                    ),
                  );
                }
            ).toList(),
          );
        },
      ),
    );
  }
}