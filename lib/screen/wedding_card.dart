import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:rj_studio/model/weddingcard.dart';


import '../CallApi/CallApi.dart';


class Wedding_Card extends StatefulWidget {
  const Wedding_Card({Key? key}) : super(key: key);

  @override
  State<Wedding_Card> createState() => _Wedding_CardState();
}

class _Wedding_CardState extends State<Wedding_Card> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Color bgcolor = Color(0xFFFFFFFF);
    Color color = Color(0xFF5982FF);

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
        body: FutureBuilder<List<WeddingCard>>(
          future: CallApi.getWedding_Card(),
          builder: (context,snapshot){
            final services = snapshot.data;

            switch (snapshot.connectionState){
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if(snapshot.hasError){
                  print(snapshot.error);
                  return Center(child: Text('Error: ${snapshot.error}'));
                }else{
                  return buildCart(services!);
                }
            }
          },
        ),
      ),
    );
  }

  }


Widget buildCart(List<WeddingCard> services)=> ListView.builder(

  physics: BouncingScrollPhysics(),
  itemCount: services.length,
  itemBuilder: (BuildContext context,int index){
    final ser = services[index];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Color(0xD76FA9FC),
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            width: 350,
              height: 220,
              child: Image.network(ser.image)
          ),
          SizedBox(height: 5),
          Text(ser.design_name,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          SizedBox(height: 5),
          Text('Price RM : '+ser.price ,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          SizedBox(height: 10),
        ],
      ),

      // child: ListTile(
      //   leading: CircleAvatar(
      //     radius: 28.0,
      //     backgroundImage: NetworkImage(ser.image),
      //     child: GestureDetector(onTap: () {
      //       Dialog(
      //         child: Container(
      //           width: 200,
      //           height: 200,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: NetworkImage(ser.image),
      //                   fit: BoxFit.cover
      //               )
      //           ),
      //         ),
      //       );
      //     }
      //     ),
      //   ),
      //   title: Text(ser.design_name,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
      //   subtitle: Text('Price RM : '+ser.price ,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
      //   // isThreeLine: true,
      // ),
    );
  },

);

// class ImageDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return Dialog(
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: NetworkImage(ser.image),
//                 fit: BoxFit.cover
//             )
//         ),
//       ),
//     );
//   }
// }