import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhonePage extends StatefulWidget {
  PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {

  TextEditingController txtPhone = TextEditingController();
  // mo ung dung quay so va dien so dien thoai
  Future<bool> openPhoneDetail(String phoneNumber) async{
    bool check = await canLaunchUrl(Uri.parse("tel:$phoneNumber"));
    if(check == false) return false;
    else return launchUrl(Uri.parse("tel:$phoneNumber"));
  }
  // mo ung dung SMS de thuc hien gui tin nhan
  Future<bool> openSMS(String phoneNumber) async{
    bool check = await canLaunch('sms:$phoneNumber');
    if(check == false) return false;
    else return launch('sms:$phoneNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Page"),
      ),
      body: Column(
          children: [
            TextField(
              controller: txtPhone,
            ),
            ElevatedButton(
                onPressed: () => openPhoneDetail(txtPhone.text), 
                child: Text("Phone")
            )
          ],
      ),
    );
  }
}