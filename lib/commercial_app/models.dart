import 'package:cloud_firestore/cloud_firestore.dart';

class Fruit{
  String id,ten;
  int gia;
  String? image;
  String? moTa;

  Fruit({
    required this.id,
    required this.ten,
    required this.gia,
    this.image,
    this.moTa,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'ten': this.ten,
      'gia': this.gia,
      'image': this.image,
      'moTa': this.moTa,
    };
  }

  factory Fruit.fromJson(Map<String, dynamic> map) {
    return Fruit(
      id: map['id'] as String,
      ten: map['ten'] as String,
      gia: map['gia'] as int,
      image: map['image'] as String,
      moTa: map['moTa'] as String,
    );
  }
}

class FruitSnapShot{
  Fruit fruit;
  DocumentReference ref;

  FruitSnapShot({
    required this.fruit,
    required this.ref,
  });

  factory FruitSnapShot.fromMap(DocumentSnapshot docSnap) {
    return FruitSnapShot(
      fruit: Fruit.fromJson(docSnap.data() as Map<String, dynamic>),
      ref: docSnap.reference,
    );
  }
  
  Future<void> capNhat(Fruit fruit){
    return ref.update(fruit.toJson());
  }
  
  static Future<DocumentReference> themMoi(Fruit fruit){
    return FirebaseFirestore.instance.collection("Fruits").add(fruit.toJson());
  }

  Future<void> xoa(Fruit fruit){
    return ref.delete();
  }

  // Truy vấn dữ liệu thời gian thực
  static Stream<List<FruitSnapShot>> getAll(){
    Stream<QuerySnapshot> sqs = FirebaseFirestore.instance.collection("Fruits").snapshots();
    return sqs.map(
            (qs) => qs.docs.map(
                    (docSnap) => FruitSnapShot.fromMap(docSnap)
            ).toList()
    );
  }

  //Truy vấn dữ liệu một lần
  static Future<List<FruitSnapShot>> getAll2() async{
    QuerySnapshot qs = await FirebaseFirestore.instance.collection("Fruits").get();
    return qs.docs.map(
            (docSnap) => FruitSnapShot.fromMap(docSnap)
    ).toList();
  }
}

class GH_Item{
  String idSP;
  int sl;
  GH_Item({required this.idSP, required this.sl});
}