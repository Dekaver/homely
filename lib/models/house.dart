import 'dart:convert';

import 'package:homely/network_utils/api.dart';

class House {
  String tipe;
  String lantai;
  String sertifikasi;
  String luasTanah;
  String luasBangunan;
  String harga;
  String alamat;
  String lokasiGps;
  String deskripsi;
  String kontak;
  List<String> gambar;
  List<String> ruangan;

  House({
    this.tipe,
    this.lantai,
    this.sertifikasi,
    this.luasTanah,
    this.luasBangunan,
    this.harga,
    this.alamat,
    this.lokasiGps,
    this.deskripsi,
    this.kontak,
    this.gambar,
    this.ruangan,
  });


  factory House.fromJson(Map<String,dynamic> json) {
    return House(
      tipe: json['tipe'], 
      lantai: json['lantai'], 
      sertifikasi: json['sertifikasi'], 
      luasTanah: json['luas_tanah'], 
      luasBangunan: json['luas_bangunan'], 
      harga: json['harga'], 
      alamat: json['alamat'], 
      lokasiGps: json['lokasi_gps'], 
      deskripsi: json['deskripsi'], 
      kontak: json['kontak'], 
      gambar: json['gambar'] ?? 'assets/images/Foto-rumah-sederhana-tapi-elegan.jpg', 
      ruangan: json['ruangan'], 
    );
  
}

  static Future<List<House>> get all async {
    var data = {'token': 'ini token'};

    var res = await Network().authData(data, '/api/login');
    var body = json.decode(res.body);
    Iterable list = body['articles'];
    return list.map((model) => House.fromJson(model)).toList();
  }

}