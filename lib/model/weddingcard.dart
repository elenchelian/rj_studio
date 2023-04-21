import 'dart:convert';

class WeddingCard{

  final int id;
  final String design_name;
  final String price;
  final String image;

  const WeddingCard({
    required this.id,
    required this.design_name,
    required this.price,
    required this.image
});

  static WeddingCard fromJson(json)=> WeddingCard(
      id: json['id'],
      design_name: json['design_name'],
      price: json['price'],
      image: json['image']
  );
  // factory Wedding_Card.fromJson(Map<String,dynamic>json) => Wedding_Card(
  //     id: json['id'],
  //     design_name: json['design_name'],
  //     price: json['price'],
  //     image: json['image']
  // );

  Map<String,dynamic> toJson() => {
    "id":id,
    "desing_name":design_name,
    "price":price,
    "image":image
  };

}