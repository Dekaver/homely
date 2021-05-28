import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.info_outline_rounded),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 8.0), child: Text('About')),
              Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Homely adalah aplikasi pencari rumah idaman sesuai dengan keinginan pengguna, mulai dari budget, lokasi, hingga fasilitas yang ada',
                    style: TextStyle(fontSize: 10, color: Colors.black87),
                  ))
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.help_outline_rounded),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 8.0), child: Text('Version')),
              Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    '1.0',
                    style: TextStyle(fontSize: 10, color: Colors.black87),
                  ))
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.error_outline_outlined),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Copyright')),
              Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    '© since 2021 Homely',
                    style: TextStyle(fontSize: 10, color: Colors.black87),
                  ))
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.work_outline_outlined),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 8.0), child: Text('Library')),
              Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Product By Flutter Framework',
                    style: TextStyle(fontSize: 10, color: Colors.black87),
                  ))
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.person_outline_rounded),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Programmer')),
              Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Alwiwahyudi8@gmail.com',
                    style: TextStyle(fontSize: 10, color: Colors.black87),
                  ))
            ],
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
