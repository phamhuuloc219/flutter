import 'models.dart';
import 'package:get/get.dart';

class SimpleControllerSP extends GetxController{
  List<Fruit> _dssp = [];
  List<Fruit> get dssp => _dssp;
  List<GH_Item> _gioHang = [];
  List<GH_Item> get gioHang => _gioHang;
  int get slMHTrongGH =>_gioHang.length;

  //get để truy cập Controller từ client
  static SimpleControllerSP get()=>Get.find<SimpleControllerSP>();

  @override
  void onReady() {
    docDuLieu();
  }
  // @override
  // void onInit() {
  //   _dssp = AppData().dssp;
  //   update(["listSP"]);
  // }

  Future<void> docDuLieu() async{
    var list = await FruitSnapShot.getAll2();
    _dssp = list.map((fruitSnap) => fruitSnap.fruit).toList();
    update(["listSP"]);
  }


  themVaoGH(Fruit f, {required List<String> updateWidgetIds, void Function(int slSP)? function}){
    for(GH_Item item in _gioHang){
      if(item.idSP == f.id){
        item.sl++;
        if(function!=null){function(item.sl);}
        return;
      }
    }
    _gioHang.add(GH_Item(idSP: f.id,sl: 1));
    update(updateWidgetIds);
  }
}


class FruitStoreBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(SimpleControllerSP());
  }
}