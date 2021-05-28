import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homely/models/house.dart';
import 'package:homely/network_utils/api.dart';

class DetailPage extends StatelessWidget {
  final dynamic house;
  DetailPage({Key key, this.house}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    return Scaffold(
      body: Column(children: <Widget>[
        CarouselSlider(
          items: <Widget>[
            for (var i = 0; i < house['images'] == null ? 0: house['images'].length ; i++)
              Container(
                  margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(Network().getUrl('/images/'+house['images'][i]['nama'])),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),                                     
          ],
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
        ),
        Text(house.toString()),
      ]),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:homely/models/house.dart';

// class DetailPage extends StatelessWidget {
//   final dynamic house;
//   DetailPage({Key key, this.house}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           //topContent
//           Stack(
//             children: <Widget>[
//               Container(
//                   padding: EdgeInsets.only(left: 10.0),
//                   height: MediaQuery.of(context).size.height * 0.5,
//                   decoration: new BoxDecoration(
//                     image: new DecorationImage(
//                       image: new AssetImage("assets/images/bubbles_pink.png"),
//                       fit: BoxFit.cover,
//                     ),
//                   )),
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 padding: EdgeInsets.all(40.0),
//                 width: MediaQuery.of(context).size.width,
//                 decoration:
//                     BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
//                 child: Center(
//                     child: Column(
//                   //topContentText
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     SizedBox(height: 120.0),
//                     Icon(
//                       Icons.directions_car,
//                       color: Colors.white,
//                       size: 40.0,
//                     ),
//                     Container(
//                       width: 90.0,
//                       child: new Divider(color: Colors.green),
//                     ),
//                     SizedBox(height: 10.0),
//                     Text(
//                       'clasik',
//                       style: TextStyle(color: Colors.white, fontSize: 45.0),
//                     ),
//                     SizedBox(height: 30.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Expanded(
//                           flex: 1,
//                           child: Container(
//                             child: LinearProgressIndicator(
//                                 backgroundColor:
//                                     Color.fromRGBO(209, 224, 224, 0.2),
//                                 value: 0.9,
//                                 valueColor:
//                                     AlwaysStoppedAnimation(Colors.green)),
//                           ),
//                         ),
//                         Expanded(
//                             flex: 6,
//                             child: Padding(
//                                 padding: EdgeInsets.only(left: 10.0),
//                                 child: Text(
//                                   house['kontak'],
//                                   style: TextStyle(color: Colors.white),
//                                 ))),
//                         Expanded(
//                           flex: 1,
//                           child: Container(
//                             padding: const EdgeInsets.all(7.0),
//                             decoration: new BoxDecoration(
//                                 border: new Border.all(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(5.0)),
//                             child: new Text(
//                               "\$" + house['tipe'],
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )),
//               ),
//               Positioned(
//                 left: 8.0,
//                 top: 60.0,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(Icons.arrow_back, color: Colors.white),
//                 ),
//               )
//             ],
//           ),
//           //bottomContent
//           Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.all(40.0),
//             child: Center(
//               child: Column(
//                 children: <Widget>[
//                   //bottomContentText
//                   Text(
//                     house['images'].toString(),
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                   //readButton
//                   Container(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       width: MediaQuery.of(context).size.width,
//                       child: RaisedButton(
//                         onPressed: () => {},
//                         color: Color.fromRGBO(58, 66, 86, 1.0),
//                         child: Text("TAKE THIS house",
//                             style: TextStyle(color: Colors.white)),
//                       )),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
