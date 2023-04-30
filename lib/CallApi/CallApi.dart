import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:rj_studio/model/booking.dart';
import 'package:rj_studio/model/otherprint.dart';
import 'package:rj_studio/model/photoshootservice.dart';
import 'package:rj_studio/model/weddingcard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/photoalbum.dart';

class CallApi{

  final String _urlphotoalbum = 'http://10.0.2.2:8000/api/list';
  final String email='';

  LoginData(data,apiURL) async{
    String fullUrl = 'http://10.0.2.2:8000/api/login';
    print(convert.jsonEncode(data));
    return await http.post(
        Uri.parse(fullUrl),
        body: convert.jsonEncode(data),
        headers: _setHeaders()
    );
  }

  RegisterData(data,apiURL) async{
    String fullUrl = 'http://10.0.2.2:8000/api/register';

    print(convert.jsonEncode(data));
    return await http.post(
        Uri.parse(fullUrl),
        body: convert.jsonEncode(data),
        headers: _setHeaders()
    );
  }

  UpdateProfile(data,apiURL) async{
    String fullUrl = 'http://10.0.2.2:8000/api/update';

    print(convert.jsonEncode(data));
    return await http.post(
        Uri.parse(fullUrl),
        body: convert.jsonEncode(data),
        headers: _setHeaders()
    );
  }

  BookingSet(data,apiURL) async{
    String fullUrl = 'http://10.0.2.2:8000/api/book';

    print(convert.jsonEncode(data));
    return await http.post(
        Uri.parse(fullUrl),
        body: convert.jsonEncode(data),
        headers: _setHeaders()
    );
  }

  static Future<List<PhotoAlbum>> getStandardPrint()async{
    final prefs = await SharedPreferences.getInstance();
    var data = 'standard_print';

    final listurl = 'http://10.0.2.2:8000/api/list?print_type=standard_print';

    final response = await http.post(Uri.parse(listurl));
    final body = json.decode(response.body);
    print('******');
    print(body);
    print(body.map<PhotoAlbum>(PhotoAlbum.fromJson).toList());
    return body.map<PhotoAlbum>(PhotoAlbum.fromJson).toList();
  }

  static Future<List<PhotoAlbum>> getAlbumPrint()async{

    final listurl = 'http://10.0.2.2:8000/api/list?print_type=album_print';

    final response = await http.post(Uri.parse(listurl));
    final body = json.decode(response.body);
    print('******');
    print(body);
    print(body.map<PhotoAlbum>(PhotoAlbum.fromJson).toList());
    return body.map<PhotoAlbum>(PhotoAlbum.fromJson).toList();
  }

  static Future<List<PhotoAlbum>> getPhotoBookRIng()async{

    final listurl = 'http://10.0.2.2:8000/api/list?print_type=photobook_ring';

    final response = await http.post(Uri.parse(listurl));
    final body = json.decode(response.body);
    print('******');
    print(body);
    print(body.map<PhotoAlbum>(PhotoAlbum.fromJson).toList());
    return body.map<PhotoAlbum>(PhotoAlbum.fromJson).toList();
  }

  static Future<List<WeddingCard>> getWedding_Card()async{

    final listurl = 'http://10.0.2.2:8000/api/weddinglist';

    final response = await http.post(Uri.parse(listurl));
    final body = json.decode(response.body);
    print('******');
    print(body);
    print(body.map<WeddingCard>(WeddingCard.fromJson).toList());
    return body.map<WeddingCard>(WeddingCard.fromJson).toList();
  }

  static Future<List<OtherPrint>> getDeskCalender()async{

    final listurl = 'http://10.0.2.2:8000/api/otherlist?print_type=desk_calender';

    final response = await http.post(Uri.parse(listurl));
    final body = json.decode(response.body);
    print('******');
    print(body);
    print(body.map<OtherPrint>(OtherPrint.fromJson).toList());
    return body.map<OtherPrint>(OtherPrint.fromJson).toList();
  }

  static Future<List<OtherPrint>> getPosterCalender()async{

    final listurl = 'http://10.0.2.2:8000/api/otherlist?print_type=poster_calender';

    final response = await http.post(Uri.parse(listurl));
    final body = json.decode(response.body);
    print('******');
    print(body);
    print(body.map<OtherPrint>(OtherPrint.fromJson).toList());
    return body.map<OtherPrint>(OtherPrint.fromJson).toList();
  }

  static Future<List<OtherPrint>> getBusinessCard()async{

    final listurl = 'http://10.0.2.2:8000/api/otherlist?print_type=busniess_card';

    final response = await http.post(Uri.parse(listurl));
    final body = json.decode(response.body);
    print('******');
    // print(body);
    print(body.map<OtherPrint>(OtherPrint.fromJson).toList());
    return body.map<OtherPrint>(OtherPrint.fromJson).toList();
  }

  static Future<List<PhotoShootService>> getpsService()async{

    final listurl = 'http://10.0.2.2:8000/api/pservice';

    final response = await http.post(Uri.parse(listurl));
    final body = json.decode(response.body);
    print('******');
    print(body);
    print(body.map<PhotoShootService>(PhotoShootService.fromJson).toList());
    return body.map<PhotoShootService>(PhotoShootService.fromJson).toList();
  }

  static Future<List<Booking>> getMyBooking()async{
    String email = '';
    final pref = await SharedPreferences.getInstance();
    email= pref.getString('custEmail')!;
    final listurl = 'http://10.0.2.2:8000/api/mybooking?email='+email;

    final response = await http.post(Uri.parse(listurl));
    final body = json.decode(response.body);
    print('******');
    print(body);
    print(body.map<Booking>(Booking.fromJson).toList());
    return body.map<Booking>(Booking.fromJson).toList();
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };



}