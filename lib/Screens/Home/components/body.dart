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
    Size size = MediaQuery.of(context).size;
    String toRupiah(int str) {
      return 'Rp.' + NumberFormat('#,##0.00', 'ID').format(str);
    }

    Container makeCard(house) => new Container(
        alignment: FractionalOffset.bottomLeft,
        padding: EdgeInsets.symmetric(vertical: 10),
        // height: size.height * 0.1,
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(house: house)));
          },
          child: Card(
            color: Colors.purple.shade900,
            child: Column(
              children: <Widget>[
                Container(
                  child: Image(
                    image: NetworkImage(Network()
                        .getUrl('/images/' + house['images'][0]['nama'])),
                    height: 50,
                  ),
                ),
                Container(
                    // color: Colors.red,
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          toRupiah(house['harga']),
                          style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(5)),
                  // color: Colors.yellowAccent,
                  child: Text(
                    "Go →",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ));

    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            itemCount: houses == null ? 0 : houses.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            // itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return makeCard(houses[index]);
            },
          );
  }
}
