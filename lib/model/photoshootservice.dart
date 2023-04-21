
import 'package:line_icons/line_icon.dart';

class PhotoShootService{

  final int id;
  final String package_name;
  final String price;
  final String line1;
  final String line2;
  final String line3;
  final String line4;

  PhotoShootService({
   required this.id,
   required this.package_name,
   required this.price,
   required this.line1,
   required this.line2,
   required this.line3,
   required this.line4
});

  static PhotoShootService fromJson(json)=> PhotoShootService(
      id: json['id'],
      package_name: json['package_name'],
      price: json['price'],
      line1: json['line1'],
      line2: json['line2'],
      line3: json['line3'],
      line4: json['line4'],
  );

  Map<String,dynamic> toJson() => {
    "id":id,
    "package_name":package_name,
    "price":price,
    "line1":line1,
    "line2":line2,
    "line3":line3,
    "line4":line4,
  };

}