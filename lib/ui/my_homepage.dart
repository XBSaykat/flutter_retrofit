import 'package:flutter/material.dart';
import 'package:flutter_retrofit/network/api/api_service.dart';
import 'package:flutter_retrofit/network/model/album_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: _listFutureAlbum(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final api = Provider.of<ApiService>(context, listen: false);
          api.getAll().then((value) {
            value.forEach((element) {
              print(element.title);
            });
          }).catchError((onError) {
            print(onError.toString());
          });
        },
        child: Icon(Icons.terrain),
      ),
    );
  }

  FutureBuilder _listFutureAlbum(BuildContext context) {
    return FutureBuilder<List<AlbumModel>>(
      future: Provider.of<ApiService>(context, listen: false).getAll(),
      builder: (BuildContext context, AsyncSnapshot<List<AlbumModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Something wrong!"),
              ),
            );
          }
          final data = snapshot.data;
          return _listOfData(context: context, data: data);
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  ListView _listOfData(
      {required BuildContext context, List<AlbumModel>? data}) {
    return ListView.builder(
        itemCount: data!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: new InkWell(
              onTap: (){
                Fluttertoast.showToast(
                  msg: data[index].title,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  fontSize: 16.0,
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Image.network(data[index].thumbnailUrl),
                  title: Text(data[index].title),
                ),
              ),
            ),
          );
        });
  }
}
