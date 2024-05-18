import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huu_loc63130680_flutter/commercial_app/models.dart';
import 'package:huu_loc63130680_flutter/commercial_app/storage_image_helper.dart';
import 'package:image_picker/image_picker.dart';

class PageCapNhatSanPhamAdmin extends StatefulWidget {
  FruitSnapShot fruitSnapShot;
  PageCapNhatSanPhamAdmin({super.key, required this.fruitSnapShot});

  @override
  State<PageCapNhatSanPhamAdmin> createState() => _PageCapNhatSanPhamAdminState();
}

class _PageCapNhatSanPhamAdminState extends State<PageCapNhatSanPhamAdmin> {
  XFile? _xFile;
  TextEditingController txtId= TextEditingController();
  TextEditingController txtGia= TextEditingController();
  TextEditingController txtMoTa= TextEditingController();
  TextEditingController txtTen= TextEditingController();

  String? imageurl;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: w*0.8,
                height:w*0.8*2/3,
                child: _xFile == null
                    ? Image.network(widget.fruitSnapShot.fruit.image!)
                    : Image.file(File(_xFile!.path)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    _xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if(_xFile!=null){
                      setState(() {
                      });
                    }

                  },
                  child: Text("Chọn ảnh"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtId,
                decoration: InputDecoration(
                    labelText: "ID", hintText: "Nhập ID sản phẩm vào đây"),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtTen,
                decoration: InputDecoration(
                    labelText: "Tên", hintText: "Nhập tên sản phẩm vào đây"),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtGia,
                decoration: InputDecoration(
                    labelText: "Giá", hintText: "Nhập giá sản phẩm vào đây"),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtMoTa,
                decoration: InputDecoration(
                    labelText: "Mô tả", hintText: "Nhập mô tả sản phẩm vào đây"),

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    Fruit fruit = Fruit(
                    id: txtId.text,
                    ten: txtTen.text,
                    gia: int.parse(txtGia.text),
                    moTa: txtMoTa.text);
                    if(_xFile!=null){
                      showMySnackBar(context, "Đang cập nhật sản phẩm...", 3);
                      imageurl = await uploadImage(
                          imagePath: _xFile!.path,
                          folders: ["fruit_app"],
                          fileName: "${txtId.text}.jpg"
                      );
                      if(imageurl!=null){
                        fruit.image= imageurl;
                        _capNhatSP(fruit);
                      }
                      else{
                        showMySnackBar(context, "Cập nhật sản phẩm không thành công", 3);
                      }
                    }else{
                      showMySnackBar(context, "Đang cập nhật sản phẩm...", 10);
                      fruit.image = widget.fruitSnapShot.fruit.image;
                      _capNhatSP(fruit);
                    }

                  },
                  child: Text("Cập nhật"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    txtId.text = widget.fruitSnapShot.fruit.id;
    txtTen.text = widget.fruitSnapShot.fruit.ten;
    txtGia.text = widget.fruitSnapShot.fruit.gia.toString();
    txtMoTa.text = widget.fruitSnapShot.fruit.moTa?? "";
  }
  _capNhatSP(Fruit fruit){
    widget.fruitSnapShot.capNhat(fruit).then(
          (value) => showMySnackBar(
              context,
              "Cập nhật thành công sản phẩm: ${txtTen.text}",
              10
          ),
    ).catchError(
        (error){
          showMySnackBar(
              context,
              "Cập nhật không thành công sản phẩm: ${txtTen.text}",
              10);
        }
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
