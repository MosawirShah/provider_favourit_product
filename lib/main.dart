// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_favourit/my_favourit.dart';

import 'favourit_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => FavouritProvider(), child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Build");
    final provider = Provider.of<FavouritProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Favourit Products",
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
          actions: [
            InkWell(
              onTap: (){
                print("hi");
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyFavourit()));
              },
                child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            )),
          ],
        ),
        body: ListView.builder(
            itemCount: 40,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 60,
                width: 280,
                color: Colors.amber[100],
                child: ListTile(
                  leading: Text("index$index"),
                  trailing: IconButton(
                    onPressed: () {
                      if (provider.itemList.contains(index)) {
                        provider.removeFromFavourit(index);
                      } else {
                        provider.addToFavourit(index);
                      }
                    },
                    icon: Consumer<FavouritProvider>(
                      builder: (context, consumer, child) {
                        return Icon(consumer.itemList.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline);
                      },
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

//WITHOUT PROVIDER
// class _MyAppState extends State<MyApp> {
//   List<int> itemList = [];
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Favourit Products",
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.amber,
//         ),
//         body: ListView.builder(
//             itemCount: 40,
//             itemBuilder: (context, index) {
//               return Container(
//                 margin: EdgeInsets.all(10),
//                 height: 60,
//                 width: 280,
//                 color: Colors.amber[100],
//                 child: ListTile(
//                   leading: Text("index$index"),
//                   trailing: IconButton(
//                     icon: Icon(itemList.contains(index)?Icons.favorite:Icons.favorite_outline),
//                     onPressed: () {
//                       if(itemList.contains(index)){
//                         itemList.remove(index);
//                       }else{
//                         itemList.add(index);
//                       }
//                       setState((){});
//                     },
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
