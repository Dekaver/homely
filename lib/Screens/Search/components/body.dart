import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Judul : $search $index",
        "Deskripsi : $search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SearchBar<Post>(
          onSearch: search,
          onItemFound: (Post post, int index) {
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.deskripsi),
            );
          },
        ),
      )
    );
  }
}

class Post {
  final String title;
  final String deskripsi;

  Post(this.title, this.deskripsi);
}
