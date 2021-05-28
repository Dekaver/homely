import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homely/network_utils/api.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final dynamic house;
  DetailPage({Key key, this.house}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String toJuta(int str) {
      return 'Rp.' + NumberFormat('#,##0 Juta', 'ID').format(str / 1000000);
    }

    CarouselController buttonCarouselController = CarouselController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text('Detail Rumah'),
      ),
      body: ListView(children: <Widget>[
        CarouselSlider(
          items: <Widget>[
            for (var i = 0; i < house['images'].length; i++)
              Container(
                margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(Network()
                        .getUrl('/images/' + house['images'][i]['nama'])),
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
            viewportFraction: 1.5,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                leading: Text(
                  "Tipe " + house['tipe'],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 40,
                      // fontFamily: "",
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                title: Text(
                  toJuta(house['harga']),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "times new roman",
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    house['alamat'],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.zoom_out_map_outlined),
                      title: Text(house['luas_tanah'].toString() + ' m²'),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.house),
                      title: Text(house['luas_bangunan'].toString() + ' m²'),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Rumah ini " + house['sertifikasi'],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        // fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ruangan :',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              Table(
                  // border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    new TableRow(
                      children: <Widget>[
                        Text('Nama Ruangan'),
                        Container(
                          height: 20,
                          child: Text("Jumlah Ruangan"),
                        ),
                      ],
                    ),
                    for (var i = 0; i < house['ruangan'].length; i++)
                      new TableRow(
                        children: <Widget>[
                          Text(house['ruangan'][i]['nama']),
                          Container(
                            height: 20,
                            child:
                                Text(house['ruangan'][i]['jumlah'].toString()),
                          ),
                        ],
                      ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Deskripsi :',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              Container(
                color: Colors.white70,
                alignment: Alignment.topLeft,
                child: Text(house["deskripsi"].toString()),
              ),
            ],
          ),
        ),
      ]),
      bottomSheet: Container(
        height: 50,
        color: Colors.purple.shade900,
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
                flex: 10,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("WhatsApp", style: TextStyle(color: Colors.white)),
                      Text("08125013****",
                          style:
                              TextStyle(fontSize: 12, color: Colors.white70)),
                    ])),
            Expanded(
              flex: 3,
              child: MaterialButton(
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.green)),
                color: Colors.white,
                child: Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 3,
              child: MaterialButton(
                shape:
                    CircleBorder(side: BorderSide(width: 3, color: Colors.red)),
                color: Colors.white,
                child: Icon(
                  Icons.chat_rounded,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
