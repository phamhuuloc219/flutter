import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huu_loc63130680_flutter/rss/controller/rss_controller_simple.dart';
import 'package:huu_loc63130680_flutter/rss/model/rss_item_template.dart';
import 'package:huu_loc63130680_flutter/rss/page/webview.dart';

class RssAPP extends StatelessWidget {
  const RssAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: RssBindings(),
      home: PageRssSimple(),
    );
  }
}

class PageRssSimple extends StatelessWidget {
  const PageRssSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${SimpleControllerRss.instance.resourceName}"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
      body:GetBuilder<SimpleControllerRss>(
        id:"listRss",
        init: SimpleControllerRss.instance,
        builder: (controller) {
          List<RSSItem> list = controller.rssList;
          return ListView.separated(
              itemBuilder: (context, index) {
               var rss = list[index];
               return Column(
                 children: [
                   GestureDetector(
                     onTap: () {
                       // Get.to(MyWebPage(
                       //     url: rss.link!,
                       //     nameResource: SimpleControllerRss.instance.resourceName,
                       // ));
                     },
                     child: Row(
                       children: [
                         Expanded(
                           flex: 1,
                           child: Image(
                               image: NetworkImage("${rss.imageUrl}"),
                           ),
                         ),
                         Expanded(
                              flex: 2,
                             child: Text("${rss.title}")
                         ),
                       ],
                     ),
                   ),
                   Text("${rss.description}")
                 ],
               );
              },
              separatorBuilder: (context, index) => Divider(thickness: 1.5,),
              itemCount: list.length
          );
        },
      ),
    );
  }
}
