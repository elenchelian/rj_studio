import 'package:flutter/material.dart';
import 'package:rj_studio/CallApi/CallApi.dart';
import 'package:rj_studio/model/otherprint.dart';

class Other_Print extends StatefulWidget {
  const Other_Print({Key? key}) : super(key: key);

  @override
  State<Other_Print> createState() => _OtherPrintState();
}

class _OtherPrintState extends State<Other_Print> {
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
                    'Desk Calender',
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
                    future: CallApi.getDeskCalender(),
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
                    'Poster Calendar',
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
                    future: CallApi.getPosterCalender(),
                    builder: (context,snapshot){
                      final services = snapshot.data;
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if(snapshot.hasError){
                            return Center (child: Text('Error:${snapshot.error}'));
                          }else{
                            return posterDatabody(services!);
                          }
                      }
                    }
                ),

                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Buisness Card',
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
                    future: CallApi.getBusinessCard(),
                    builder: (context,snapshot){
                      final service = snapshot.data;
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if(snapshot.hasError){
                            return Center (child: Text('Error:${snapshot.error}'));
                          }else{
                            return BusinessCardBody(service!);
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

SingleChildScrollView dataBody(List<OtherPrint> listSales) {
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
      columns:const [
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
              print(sale.id);
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

SingleChildScrollView posterDatabody(List<OtherPrint> listSales) {
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
      columns: const [
        DataColumn(
          label: Text("Timeline"),
          numeric: false,
          tooltip: "Timeline",
        ),
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
              print(sale.id);
            },
            cells: [
              DataCell(
                Text(sale.months.toString(),textAlign: TextAlign.center,),
              ),
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

SingleChildScrollView BusinessCardBody(List<OtherPrint> listSales) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) => Color(0xFF5982FF)),
      headingRowHeight: 36,
      headingTextStyle: TextStyle(color: Colors.white),
      sortColumnIndex: 0,
      showCheckboxColumn: false,
      border: TableBorder.all(
        color: Colors.black,
      ),
      columns: const [
        DataColumn(
          label: Text("Quantity"),
          numeric: false,
          tooltip: "Quantity",
        ),
        DataColumn(
          label: Text("157 gsm Price (MYR)"),
          numeric: false,
          tooltip: "157 gsm Price (MYR)",
        ),
        DataColumn(
          label: Text("260 gsm Price (MYR)"),
          numeric: false,
          tooltip: "260 gsm Price (MYR)",
        ),
        DataColumn(
          label: Text("310 gsm Price Price (MYR)"),
          numeric: false,
          tooltip: "310 gsm Price (MYR)",
        ),
      ],
      rows: listSales
          .map(
            (sale) => DataRow(
            onSelectChanged: (b) {
              print(sale.id);
            },
            cells: [
              DataCell(
                Text(sale.quantity.toString(),textAlign: TextAlign.justify,),
              ),
              DataCell(
                  Text(sale.onegsm.toString(),textAlign: TextAlign.center,)
              ),
              DataCell(
                Text(sale.twogsm.toString(),textAlign: TextAlign.center,),
              ),
              DataCell(
                Text(sale.threegsm.toString(),textAlign: TextAlign.center,),
              ),
            ]),
      )
          .toList(),
    ),
  );
}