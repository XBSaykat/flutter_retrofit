import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_retrofit/network/model/album_model.dart';

class DetailScreen extends StatelessWidget {
  late AlbumModel alldata;
  DetailScreen({required this.alldata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
        child: Material(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Image.network(alldata.thumbnailUrl),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  alldata.title,
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
