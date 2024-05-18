import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:huu_loc63130680_flutter/commercial_app/models.dart';
import 'package:huu_loc63130680_flutter/commercial_app/page_cap_nhat_sp.dart';
import 'package:huu_loc63130680_flutter/commercial_app/page_chi_tiet_sp_admin.dart';
import 'package:huu_loc63130680_flutter/commercial_app/storage_image_helper.dart';
import 'package:huu_loc63130680_flutter/widget_connect_firebase.dart';

class FruitStoreAdmin extends StatelessWidget {
  const FruitStoreAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(
        errorMessage: "errorMessage",
        connectingMessage: "connectingMessage",
        builder: (context) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: PageDSSP_Admin(),
        ),
    );
  }
}
class PageDSSP_Admin extends StatelessWidget {
  const PageDSSP_Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADMIN Fruit"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StreamBuilder<List<FruitSnapShot>>(
        stream: FruitSnapShot.getAll(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            return Center(child: Text("Error"),);

          if(!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),);
          List<FruitSnapShot> list = snapshot.data!;
          return ListView.separated(
              itemBuilder: (context, index) {
                FruitSnapShot fs = list[index];
                return Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 0.6,
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PageCapNhatSanPhamAdmin(fruitSnapShot: fs,),));
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: "Cập nhật",
                      ),
                      SlidableAction(
                        onPressed: (context) async{
                          await deleteImage(folders: ["fruit_app"], fileName: "${fs.fruit.id}.jpg");
                          await fs.xoa(fs.fruit);
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: "Xóa",
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.network(fs.fruit.image!,height: 100,width: 100,)
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ID: ${fs.fruit.id}"),
                            Text("Tên: ${fs.fruit.ten}"),
                            Text("Giá: ${fs.fruit.gia}"),
                            Text("Mô tả: ${fs.fruit.moTa}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(thickness: 1.5,),
              itemCount: list.length
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageChiTietSanPhamAdmin(),));
        },
      ),
    );
  }
}
showMySnackBar(BuildContext context, String thongBao, int giay){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(thongBao),
      duration: Duration(seconds: giay),
    ),
  );
}
