import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 56,
          backgroundImage: NetworkImage(
              'https://www.freeiconspng.com/uploads/female-user-icon-clip-art--30.png'),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Alwi Wahyudi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Icon(Icons.person),
                  Text('Alwi Wahyudi'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Icon(Icons.phone),
                  Text('0812-5013-7084'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
