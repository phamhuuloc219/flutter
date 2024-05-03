import 'package:get/get.dart';
import 'package:huu_loc63130680_flutter/commercial_app/models.dart';

class FirebaseController extends GetxController{
  final _dssp = <FruitSnapShot>[].obs;

  List<GH_Item> _gioHang = [];
  List<GH_Item> get gioHang => _gioHang;
  int get slMHTrongGH =>_gioHang.length;

  List<FruitSnapShot> get dssp => _dssp.value;

  static FirebaseController get instance => Get.find<FirebaseController>();

  @override
  void onReady() {
    _dssp.bindStream(FruitSnapShot.getAll());
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

class FirebaseControllerBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(FirebaseController());
  }
}