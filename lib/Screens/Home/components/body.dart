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
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                      alignment: FractionalOffset.bottomLeft,
                      height: size.height * 0.2,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(house: house)));
                        },
                        child: Card(
                          color: Colors.blue.shade400,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child:Image(
                                image: AssetImage(
                                    'assets/images/Foto-rumah-sederhana-tapi-elegan.jpg'),
                                height: size.height * 0.12,
                                // width: size.width * 0.4,
                              ),
                              ),
                              Container(
                                color: Colors.red,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(toRupiah(house['harga']))
                                ],
                              )

                              ),
                            ],
                          ),
                        ),
                      ))),
            ],
          ),
        );

    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            // itemCount: houses == null ? 0 : houses.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return makeCard(houses[0]);
            }, 
          );
  }
}
