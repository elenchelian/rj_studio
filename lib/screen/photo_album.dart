import 'package:flutter/material.dart';
import 'package:rj_studio/CallApi/CallApi.dart';

import '../model/photoalbum.dart';

class Photo_Album extends StatefulWidget {
  const Photo_Album({Key? key}) : super(key: key);

  @override
  State<Photo_Album> createState() => _Photo_AlbumState();
}

class _Photo_AlbumState extends State<Photo_Album> {


  @override
  void initState(){

  }

  @override
  Widget build(BuildContext context) {
    Color bgcolor = Color(0xFFFFFFFF);
    Color color= Color(0xFF5982FF);

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: color,
          leading: const BackButton(
            color: Colors.white, // <-- SEE HERE
          ),
          title: RichText(
            text: TextSpan(
              text: 'Photo and Album Printing',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,

              ),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.5,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Standard Photo Print',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                FutureBuilder(
                  future: CallApi.getStandardPrint(),
                    builder: (context,snapshot){
                    final services = snapshot.data;
                    switch(snapshot.connectionState){
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if(snapshot.hasError){
                          return Center (child: Text('Error:${snapshot.error}'));
                        }else{
                          return dataBody(services!);
                        }
                    }
                    }
                ),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Album Print',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                FutureBuilder(
                    future: CallApi.getAlbumPrint(),
                    builder: (context,snapshot){
                      final services = snapshot.data;
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if(snapshot.hasError){
                            return Center (child: Text('Error:${snapshot.error}'));
                          }else{
                            return dataBody(services!);
                          }
                      }
                    }
                ),

                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'PhotoBook Ring',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                FutureBuilder(
                    future: CallApi.getPhotoBookRIng(),
                    builder: (context,snapshot){
                      final services = snapshot.data;
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if(snapshot.hasError){
                            return Center (child: Text('Error:${snapshot.error}'));
                          }else{
                            return dataBody(services!);
                          }
                      }
                    }
                ),
                SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

SingleChildScrollView dataBody(List<PhotoAlbum> listSales) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) => Color(0xFF5982FF)),
      headingRowHeight: 36,
      headingTextStyle: TextStyle(color: Colors.white),
      sortColumnIndex: 0,
      showCheckboxColumn: false,
      border: TableBorder.all(
        color: Colors.black,
      ),
      columns: [
        DataColumn(
            label: Text("Size"),
            numeric: false,
            tooltip: "Size",
        ),
        DataColumn(
          label: Text("Price (MYR)"),
          numeric: false,
          tooltip: "Price",
        ),
      ],
      rows: listSales
          .map(
            (sale) => DataRow(
            onSelectChanged: (b) {
              print(sale.id.toString());
            },
            cells: [
              DataCell(

                  Text(sale.size.toString(),textAlign: TextAlign.center,)
              ),
              DataCell(
                Text(sale.price.toString(),textAlign: TextAlign.center,),
              ),
            ]),
      )
          .toList(),
    ),
  );
}