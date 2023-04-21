import 'dart:convert';

class PhotoAlbum{
  final int id;
  final String print_type;
  final String size;
  final String price;

  const PhotoAlbum({
   required this.id,
   required this.print_type,
   required this.size,
   required this.price
});

  // factory PhotoAlbum.fromJson(Map<String,dynamic>json) => PhotoAlbum(
  //     id: json['id'],
  //     print_type: json['print_type'],
  //     size: json['size'],
  //     price: json['price']
  // );

  static PhotoAlbum fromJson(json)=> PhotoAlbum(
      id: json['id'],
      print_type: json['print_type'],
      size: json['size'],
      price: json['price']
  );

  Map<String,dynamic> toJson() => {
    "id":id,
    "print_type":print_type,
    "size":size,
    "price":price
  };
}