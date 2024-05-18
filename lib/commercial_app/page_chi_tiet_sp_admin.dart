import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huu_loc63130680_flutter/commercial_app/models.dart';
import 'package:huu_loc63130680_flutter/commercial_app/storage_image_helper.dart';
import 'package:image_picker/image_picker.dart';

class PageChiTietSanPhamAdmin extends StatefulWidget {
  const PageChiTietSanPhamAdmin({super.key});

  @override
  State<PageChiTietSanPhamAdmin> createState() => _PageChiTietSanPhamAdminState();
}

class _PageChiTietSanPhamAdminState extends State<PageChiTietSanPhamAdmin> {
  XFile? _xFile;
  TextEditingController txtId= TextEditingController();
  TextEditingController txtGia= TextEditingController();
  TextEditingController txtMoTa= TextEditingController();
  TextEditingController txtTen= TextEditingController();
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
                      ? Icon(Icons.image)
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
                      // 1.thêm ảnh, lấy đường dẫn ảnh
                      // if(_xFile!=null) {
                      //   String url = await uploadImage(
                      //       imagePath: _xFile!.path,
                      //       folders: ["fruit_app"],
                      //       fileName: "${txtId.text}.jpg"
                      //   );
                      // }
                      uploadImage(
                            imagePath: _xFile!.path,
                            folders: ["fruit_app"],
                            fileName: "${txtId.text}.jpg"
                      ).then((url) async{
                        // 2.thêm dữ liệu vào FireStore
                        Fruit f = Fruit(
                            id: txtId.text,
                            ten: txtTen.text,
                            gia: int.parse(txtGia.text),
                            moTa: txtMoTa.text,
                            image: url
                        );
                        await FruitSnapShot.themMoi(f);
                        showMySnackBar(context, "Thêm sản phẩm ${txtTen.text} thành công!", 1);
                      }).catchError(
                          (error){
                            showMySnackBar(context, "Lỗi thêm sản phẩm !!!", 1);
                            print(error.toString());
                          }
                      );

                      },
                    child: Text("Thêm"),
                  ),
                ],
              ),
            ],
          ),
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
