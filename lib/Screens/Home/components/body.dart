import 'package:flutter/material.dart';
import 'package:homely/Screens/Home/detail.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class House {
  String tipe;
  String kategori;
  String lantai;
  String kamarTidur;
  String kamarMandi;
  String sertifikasi;
  String luasTanah;
  String harga;
  String luasBangunan;
  String alamat;
  String lokasiGps;
  String deskripsi;
  String kontak;

  House(
      {this.tipe,
      this.kategori,
      this.harga,
      this.lantai,
      this.kamarTidur,
      this.kamarMandi,
      this.sertifikasi,
      this.luasTanah,
      this.luasBangunan,
      this.alamat,
      this.lokasiGps,
      this.deskripsi,
      this.kontak});
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List houses;

  @override
  void initState() {
    houses = gethouses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String toRupiah(String str){
      return 'Rp.' + NumberFormat('#,##0.00', 'ID').format(int.parse(str));
    }

    Container makeCard(House house) => new Container(
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
                          Text(toRupiah(house.harga),
                              style: TextStyle(fontFamily: 'Poppins').copyWith(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600)),
                          Container(height: 10.0),
                          Text(house.alamat.substring(0, 36) + '...',
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
                                Text(house.kamarMandi),
                              ])),
                              Expanded(
                                  child: Row(children: <Widget>[
                                Icon(
                                  Icons.king_bed,
                                  size: 12.0,
                                ),
                                Container(width: 8.0),
                                Text(house.kamarTidur),
                              ])),
                              Expanded(
                                  child: Row(children: <Widget>[
                                Icon(Icons.zoom_out_map, size: 12.0),
                                Container(width: 8.0),
                                Text(house.luasTanah),
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

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: houses.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(houses[index]);
        },
      ),
    );
  }
}

// onTap:
List gethouses() {
  return [
    House(
      tipe: '46',
      kategori: 'clasik',
      lantai: '2',
      kamarTidur: '4',
      kamarMandi: '2',
      sertifikasi: 'Sertifikat',
      luasTanah: '200',
      harga: '175000000',
      luasBangunan: '150',
      alamat:
          'Jln. Batu ampar, Km.4, Kecamatan Balikpapan Utara, Kota Balikpapan, Kabupaten Kalimantan Timur',
      lokasiGps: '1231313213231 1232132112123',
      deskripsi: 'Rumah ini memiliki 2 pintu depan',
      kontak: '081250137084',
    ),
    House(
      tipe: '46',
      kategori: 'Jungle',
      lantai: '2',
      kamarTidur: '4',
      kamarMandi: '2',
      sertifikasi: 'Sertifikat',
      luasTanah: '200',
      harga: '155000000',
      luasBangunan: '150',
      alamat:
          'Jln. Batu ampar, Km.4, Kecamatan Balikpapan Utara, Kota Balikpapan, Kabupaten Kalimantan Timur',
      lokasiGps: '1231313213231 1232132112123',
      deskripsi: 'Rumah ini memiliki 2 pintu depan',
      kontak: '081250137084',
    ),
    House(
      tipe: '46',
      kategori: 'Istana',
      lantai: '2',
      kamarTidur: '4',
      kamarMandi: '2',
      sertifikasi: 'Sertifikat',
      luasTanah: '200',
      harga: '190000000',
      luasBangunan: '150',
      alamat:
          'Jln. Batu ampar, Km.4, Kecamatan Balikpapan Utara, Kota Balikpapan, Kabupaten Kalimantan Timur',
      lokasiGps: '1231313213231 1232132112123',
      deskripsi: 'Rumah ini memiliki 2 pintu depan',
      kontak: '081250137084',
    ),
  ];
}
