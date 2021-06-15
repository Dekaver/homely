import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Judul : $search $index",
        "Deskripsi : $search $index",
      );
    });
  }
  List<String> _locations = ['A', 'B', 'C', 'D'];
  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: DropdownButton(
            hint: Text('Please choose a location'), // Not necessary for Option 1
            value: _locations,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            },
            items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),
        );
    // return SafeArea(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     child: SearchBar<Post>(
    //       onSearch: search,
    //       onItemFound: (Post post, int index) {
    //         return ListTile(
    //           title: Text(post.title),
    //           subtitle: Text(post.deskripsi),
    //         );
    //       },
    //     ),
    //   )
    // );
  }
}

class Post {
  final String title;
  final String deskripsi;

  Post(this.title, this.deskripsi);
}
