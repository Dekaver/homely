import 'package:flutter_test/flutter_test.dart';
import 'package:homely/network_utils/api.dart';
import 'dart:convert';

void main() {
  Future<String> login(String email, String password) async {
    var data = {'email': email, 'password': password};

    var res = await Network().authData(data, '/api/login');
    var body = json.decode(res.body);
    var msg = await body['msg'];

    return msg;
  }

  Future<String> register(String name, String email, String password, String passwordconfirmation) async {
    var data = {'name': name, 'email': email, 'password': password, 'password_confirmation': passwordconfirmation};

    var res = await Network().authData(data, '/api/signup');
    var body = json.decode(res.body);
    var msg = await body['msg'];

    return msg;
  }

  test('success login', () async {
    String result;
    await login('admin@gmail.com', '12345678')
        .then((value) => {result = value});
    expect(result, 'Login successfully');
  });

  test('failed login email password not match', () async {
    String result;
    await login('admin@gmail.com', '1234567899')
        .then((value) => {result = value});
    expect(result, 'Unathorized');
  });
  test('failed login validator error', () async {
    String result;
    await login('admin', '1234567')
        .then((value) => {result = value});
    expect(result, 'Validator error');
  });
    test('success register', () async {
    String result;
    await register('userrr', 'userrr@gmail.com', '12345678', '12345678')
        .then((value) => {result = value});
    expect(result, 'Register successfully');
  });
}
