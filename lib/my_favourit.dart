import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_favourit/favourit_provider.dart';
class MyFavourit extends StatelessWidget {
  const MyFavourit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouritProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourits"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
          itemCount: provider.itemList.length,
          itemBuilder: (context, index){
        return ListTile(
          title: Text("index$index"),

        );
      }),
    );
  }
}
