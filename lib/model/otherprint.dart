
class OtherPrint{
  final int id;
  final String print_type;
  final String size;
  final String price;
  final String months;
  final String quantity;
  final String onegsm;
  final String twogsm;
  final String threegsm;

  const OtherPrint({
    required this.id,
    required this.print_type,
    required this.size,
    required this.price,
    required this.months,
    required this.quantity,
    required this.onegsm,
    required this.twogsm,
    required this.threegsm,
});

  static OtherPrint fromJson(json)=> OtherPrint(
      id: json['id'],
      print_type: json['print_type'],
      size: json['size'],
      price: json['price'],
      months: json['months'],
      quantity: json['quantity'],
      onegsm: json['onegsm'],
      twogsm: json['twogsm'],
      threegsm: json['threegsm']
  );

  // factory OtherPrint.fromJson(Map<String,dynamic>json) => OtherPrint(
  //     id: json['id'],
  //     print_type: json['print_type'],
  //     size: json['size'],
  //     price: json['price'],
  //     months: json['months'],
  //     quantity: json['quantity'],
  //     onegsm: json['onegsm'],
  //     twogsm: json['twogsm'],
  //     threegsm: json['threegsm']
  // );

  Map<String,dynamic> toJson() => {
    "id":id,
    "print_type":print_type,
    "size":size,
    "price":price,
    "months":months,
    "quantity":quantity,
    "onegsm":onegsm,
    "twogsm":twogsm,
    "threegsm":threegsm,
  };

}