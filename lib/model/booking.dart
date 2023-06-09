
import 'package:line_icons/line_icon.dart';

class Booking {

  final int id;
  final String email;
  final String name;
  final String phonenum;
  final String package;
  final String date;
  final String price;
  final String category;
  final String time;
  final String deposit;
  final String balance;

  Booking({
    required this.id,
    required this.email,
    required this.name,
    required this.package,
    required this.date,
    required this.category,
    required this.phonenum,
    required this.price,
    required this.deposit,
    required this.time,
    required this.balance
});


  static Booking fromJson(json)=> Booking(
    id: json['id'],
    email: json['email'],
    name: json['name'],
    package: json['package'],
    date: json['date'],
    time:json['time'],
    phonenum: json['phonenum'],
    price:json['price'],
    category: json['category'],
      deposit: json['deposit'],
    balance: json['balance']

  );

  Map<String,dynamic> toJson() => {
    "id":id,
    "email":email,
    "name":name,
    "package":package,
    "date":date,
    "time":time,
    "phonenum":phonenum,
    "price":price,
    "category":category,
    "deposit":deposit,
    "balance":balance
  };

}