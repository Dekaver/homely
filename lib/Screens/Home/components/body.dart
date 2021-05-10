import 'package:flutter/material.dart';
import 'package:homely/Screens/Home/detail.dart';
import 'package:homely/network_utils/api.dart';
import 'dart:async';
import 'dart:convert';

import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State {
  List houses;
  bool isLoading;

  Future<String> getData() async {
    setState(() {
      isLoading = true;
    });
    var res = await new Network().getData('/api/houses');
    houses = json.decode(res.body);

    // await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
    return "Success!";
  }

  @override
  // ignore: must_call_super
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    String toRupiah(String str) {
      return 'Rp.' + NumberFormat('#,##0.00', 'ID').format(int.parse(str));
    }

    Container makeCard(house) => new Container(
          child: Container(
              height: 120.0,
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
              ),
              child: Stack(
                children: <Widget>[
                  //card
                  Container(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(76.0, 16.0, 36.0, 16.0),
                      constraints: BoxConstraints.expand(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(height: 4.0),
                          Text(toRupiah(house['harga'].toString()),
                              style: TextStyle(fontFamily: 'Poppins').copyWith(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600)),
                          Container(height: 10.0),
                          Text(house['alamat'] + '...',
                              style: TextStyle(fontFamily: 'Poppins')
                                  .copyWith(
                                      color: Colors.grey,
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.w400)
                                  .copyWith(fontSize: 12.0)),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              height: 2.0,
                              width: 18.0,
                              color: Color(0xffffc6ff)),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Row(children: <Widget>[
                                Icon(Icons.bathtub, size: 12.0),
                                Container(width: 8.0),
                                Text(house['alamat']),
                              ])),
                              Expanded(
                                  child: Row(children: <Widget>[
                                Icon(
                                  Icons.king_bed,
                                  size: 12.0,
                                ),
                                Container(width: 8.0),
                                Text(house['alamat']),
                              ])),
                              Expanded(
                                  child: Row(children: <Widget>[
                                Icon(Icons.zoom_out_map, size: 12.0),
                                Container(width: 8.0),
                                Text(house['luas_tanah'].toString()),
                              ])),
                            ],
                          ),
                        ],
                      ),
                    ),
                    height: 124.0,
                    margin: EdgeInsets.only(left: 46.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade500,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                  ),
                  //Card Image
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0),
                    alignment: FractionalOffset.centerLeft,
                    child: Image(
                      image: AssetImage(
                          'assets/images/Foto-rumah-sederhana-tapi-elegan.jpg'),
                      height: 92.0,
                      width: 92.0,
                    ),
                  ),
                  //Button right
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0),
                    alignment: FractionalOffset.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(house: house)));
                        },
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 50,
                          color: Colors.grey,
                        )),
                  ),
                ],
              )),
        );

    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: houses == null ? 0 : houses.length,
            itemBuilder: (BuildContext context, int index) {
              return makeCard(houses[index]);
            },
          );
  }
}
