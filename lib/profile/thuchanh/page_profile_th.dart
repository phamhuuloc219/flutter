import 'package:flutter/material.dart';
import 'package:huu_loc63130680_flutter/widgets/dropdown_button.dart';
import 'package:huu_loc63130680_flutter/widgets/radio_button.dart';
import 'package:huu_loc63130680_flutter/widgets/wrapper_data.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  StringWrapper gioiTinh= StringWrapper(value:"Nam");
  StringWrapper nguoiYeu= StringWrapper(value:"Rồi");
  StringWrapper pt=StringWrapper(value: "Cộng");
  StringWrapper monHoc=StringWrapper(value: "LTTBDD");
  StringWrapper monAn=StringWrapper(value: "Đào");
  DateTime? ngaySinh=DateTime(2003,09,21);
  // String? phepTinh="Cộng";
  // List<String> phepTinhs=["Cộng","Trừ","Nhân","Chia","Đạo hàm","Tích phân","Biết hết"];
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My Profile"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("asset/images/phl.jpg"),
                ),
                accountName: Text("Phạm Hữu Lộc"), 
                accountEmail: Text("phamhuuloc2192003@gmail.com")
            ),
            GestureDetector(
              onTap: () {
                //Navigator toi 1 trang
              },
              child: ListTile(
                leading: Icon(Icons.inbox),
                title: Text("Inbox"),
                trailing: Text("10"),
              ),
            )
          ],

        ),
      ),
      body: _buildBody(context,index),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: Colors.lightBlue,),
            icon: Icon(Icons.home, color: Colors.grey,),
            label: "Home"
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.sms,color: Colors.orange,),
              icon: Icon(Icons.sms, color: Colors.grey,),
              label: "SMS"
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.call,color: Colors.red,),
              icon: Icon(Icons.call, color: Colors.grey,),
              label: "Call"
          )
        ],
        onTap: (value){
          setState(() {
            index=value;
          });
        },
      ),
    );
  }

  _buildBody(BuildContext context, int index) {
    switch(index){
      case 0: return _buildHome(context);
      case 1: return _buildSMS(context);
      case 2: return _buildPhone(context);
    }
  }

  _buildHome(BuildContext context) {
    return
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 300,
                height: 200,
                child: Image.asset("asset/images/phl.jpg"),
              ),
            ),
            // trái tim
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                ),
              ],
            ),
            //
            Text("Họ tên: "),
            Text("Phạm Hữu Lộc",
              style:TextStyle(color: Colors.blue,fontSize: 20),
            ),
            SizedBox(height: 15,),
            Text("Ngày sinh"),
            Row(
              children: [
                Expanded(child: Text("${ngaySinh?.day?? 1}/${ngaySinh?.month?? 1}/${ngaySinh?.year??2003}")),
                IconButton(
                  onPressed: () async{
                    DateTime? d = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2050)
                    );
                    if(d!=null){
                      setState(() {
                        ngaySinh=d;
                      });
                    }
                  },
                  icon: Icon(Icons.calendar_month_outlined) ,
                ),
                SizedBox(width: 20,)
              ],
            ),
            SizedBox(height: 15,),
            Text("Giới tính:"),
            // giới tính
            // Row(
            //   children: [
            //     Expanded(
            //       child: ListTile(
            //         leading: Radio(
            //           groupValue: gioiTinh,
            //           value:"nam" ,
            //           onChanged: (value){
            //             setState(() {
            //               gioiTinh=value as String;
            //             });
            //           },
            //         ),
            //         title: Text("Nam"),
            //       ),
            //     ),
            //     Expanded(
            //       child: ListTile(
            //         leading: Radio(
            //           groupValue: gioiTinh,
            //           value:"nữ" ,
            //           onChanged: (value){
            //             setState(() {
            //               gioiTinh=value as String;
            //             });
            //           },
            //         ),
            //         title: Text("Nữ"),
            //       ),
            //     )
            //   ],
            // ),
            MyGroupRadio(labels: ["Nam","Nữ"], groupValue: gioiTinh,),
            SizedBox(height: 15,),
            Text("Bạn có người yêu chưa"),
            MyGroupRadio(labels: ["Rồi","Chưa"], groupValue: nguoiYeu,isHorizotal: false,),
            Text("Phép tính giỏi nhất của bạn:"),
            // DropdownButton<String>(
            //   isExpanded: true,
            //   value: phepTinh,
            //   items: phepTinhs.map(
            //           (phepTinh) => DropdownMenuItem(
            //         child: Text(phepTinh),
            //         value: phepTinh,)
            //   ).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       phepTinh=value;
            //     });
            //   },
            // ),
            MyDropdownButton(
              labelItems: ["Cộng","Trừ","Nhân","Chia","Đạo hàm","Tích phân","Biết hết"],
              value: pt,
            ),
            Text("Món ăn yêu thích của bạn:"),
            MyDropdownButton(
              labelItems: ["Đào","Phở","Piano","Mai"],
              value: monAn,
            ),
            Text("Quê quán :"),
            Text("Cam Lâm, Khánh Hòa",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,),),
            Text("Sở thích:"),
            Text("Nghe nhạc, xem phim, MMA",
              style:TextStyle(
                fontSize: 15,
                color: Colors.blueGrey ,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSMS(BuildContext context) {
    return Center(
      child: Text("Gửi tin nhắn",style: TextStyle(color: Colors.blue,fontSize: 20,),),
    );
  }

  _buildPhone(BuildContext context) {
    var launch ;
    return Center(
      child: Text("Gọi điện thoại",style: TextStyle(color: Colors.blue,fontSize: 20,),),
    );
  }
}