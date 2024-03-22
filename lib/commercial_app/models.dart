class Fruit{
  String id,ten;
  int gia;
  String? url;
  String? mota;

  Fruit({required this.id, required this.ten, required this.gia, this.url, this.mota});

}

Map<String, String> images = {
  "xoai" : "https://vnn-imgs-f.vgcloud.vn/2019/06/01/14/tu-vu-be-9-tuoi-suyt-chet-vi-an-xoai-chuyen-gia-canh-bao-khong-an-xoai-neu-co-dau-hieu-sau.jpg",
  "mit" : "https://citifruit.com/uploads/images/qua-mit-1.jpg",
  "mangcut" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5eghqL-ia8jwq7kfWQdRTZ2rnnhHhdB3a-AraYrR9AVA5DegF_6Pw9UiBZnI0jbi9QlU&usqp=CAU",
  "saurieng" : "https://citifruit.com/uploads/images/Products/60/Sau-Rieng-02-800%C3%97800.jpg",
  "chomchom" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8NCRYx-BXEM0K2p408RXE_zUKqykr3sZM8o1YTNyZT3hk6BFmuXsMwp7lDWOUmIYJjsI&usqp=CAU",
  "nhan" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8ftfI7KH1WbLhvrjI2xNi8aBtQ88Sswy6iDsCWcFS-omXfw9sNXbfGtafsjeoS2QVa4E&usqp=CAU",
  "buoi" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT45N9qhr17ZlKn0hPocUatu8y_GVjyoNdquBHpzW3UGOwVt8Lc2IUIEcHE_IzP0r7G-hA",
  "cam" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8oRR85ZRytw7wjEjXXlUBaRl-Grp29KWUu0vSTxp5b8SVBMnyr611B5uGZTLys0zG-kU",
  "nho" : "https://bizweb.dktcdn.net/100/433/790/products/nhodocohatredglobeuc1kg.jpg?v=1630326390950",
  "tao" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSavrv-RJzhehL8cDGOQdFKTFFYtZzmhRNnE6nkKKKQgXbVgNvz1QX7mIq-slImoYOjQ1M",
};

class AppData{
  final List<Fruit> _dssp = [
    Fruit(id:"01", ten: "Xoài", gia: 25000,url: images["xoai"],mota: "Xoài siêu ngọt"),
    Fruit(id:"02", ten: "Mít", gia: 25000,url: images["mit"],mota: "Mít thơm ngon"),
    Fruit(id:"03", ten: "Măng cụt", gia: 30000,url: images["mangcut"],mota: "Măng cụt chua ngọt"),
    Fruit(id:"04", ten: "Sầu riêng", gia: 200000,url: images["saurieng"],mota: "Sầu riêng thơm ngon"),
    Fruit(id:"05", ten: "Chôm chôm", gia: 25000,url: images["chomchom"],mota: "Chôm chôm siêu ngọt"),
    Fruit(id:"06", ten: "Nhãn", gia: 25000,url: images["nhan"],mota: "Nhãn hạt tiêu siêu ngọt"),
    Fruit(id:"07", ten: "Bưởi", gia: 15000,url: images["buoi"],mota: "Bưởi 5 roi siêu ngon"),
    Fruit(id:"08", ten: "Cam", gia: 35000,url: images["cam"],mota: "Cam sành siêu ngọt"),
    Fruit(id:"09", ten: "Nho", gia: 50000,url: images["nho"],mota: "Nho Mỹ"),
    Fruit(id:"10", ten: "Táo", gia: 95000,url: images["tao"],mota: "Táo ngon lắm"),
  ];
  List<Fruit> get dssp => _dssp;
}

class GH_Item{
  String idSP;
  int sl;
  GH_Item({required this.idSP, required this.sl});
}