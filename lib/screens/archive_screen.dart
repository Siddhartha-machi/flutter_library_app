import 'package:flutter/material.dart';
import '../screens/archive_item_screen.dart';
import 'package:provider/provider.dart';

import '../models/database.dart';
import '../models/element_datails.dart';

class ArchiveScreen extends StatelessWidget {
  static const routename = '/acrchive';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    final viewerlist = data.viewlist;

    Widget buildtile(ElementDetails packet) {
      return InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(ArchiveItemScreen.routename, arguments: packet.id),
        child: Card(
          // color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    packet.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                // color: Colors.pink,
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(packet.imagesource),
                ),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Author :${packet.author}'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Pages :${packet.pages}'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Copies :${packet.copies}'),
                    ),
                  ],
                ),
              ),
              const ListTile(
                title: Text("Like"),
                leading: Icon(Icons.favorite_border),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Archives'),
        ),
        body: GridView.builder(
          itemCount: viewerlist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 400,
          ),
          itemBuilder: (ctx, index) {
            return buildtile(viewerlist[index]);
          },
        ));
  }
}
