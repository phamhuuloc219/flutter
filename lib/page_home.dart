import 'package:flutter/material.dart';
import 'package:huu_loc63130680_flutter/commercial_app/home_page_store.dart';
import 'package:huu_loc63130680_flutter/profile/thuchanh/page_profile_th.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MyApp"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildButton(context, label:"My Profile", destination: MyProfile()),
              _buildButton(context, label: "Fruit Store", destination: AppFruitStore())
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildButton(BuildContext context, {required String label, required Widget destination}){
  return Container(
    width: 180,
    child: ElevatedButton(
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => destination,)
          );
        },
        child: Text(label)
    ),
  );
}
