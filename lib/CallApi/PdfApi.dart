
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfApi{
  static Future<void> askPermissions() async {
    await [
      Permission.storage,
    ].request();
  }

  static Future <File> generateTable() async{
    // askPermissions();
    
    final pdf = Document(version:PdfVersion.pdf_1_5,compress: true);
    final prefs = await SharedPreferences.getInstance();
    
    // var custName = prefs.getString('custName');
    // var custPhone = prefs.getString('custPhone');
    var package_name = prefs.getString('package_name');
    var date = prefs.getString('date');
    var price = prefs.getString('price');
    
    pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      build: (Context context){
        return Center(
          child: Text("Payment Receipt $price"),
        );
      }
    ));

    return saveDocument(name: 'receipt.pdf', pdf: pdf);
    
  }
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
      }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    print(file.toString());
    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }


}