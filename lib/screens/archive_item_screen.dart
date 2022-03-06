import 'package:flutter/material.dart';
import 'package:libraryapp/models/database.dart';

import 'package:provider/provider.dart';

class ArchiveItemScreen extends StatelessWidget {
  static const routename = '/itemscreen';
  // final id;
  // ArchiveItemScreen(this.id);

  @override
  Widget build(BuildContext context) {
    final titleargs = ModalRoute.of(context)!.settings.arguments as String;
    final datareference = Provider.of<Data>(context).getitem(titleargs);

    return Scaffold(
      appBar: AppBar(
        title: Text(datareference.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 400,
              width: double.infinity,
              child: FittedBox(
                child: Image.asset(datareference.imagesource),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              'Book Title :${datareference.title}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text('Written by :${datareference.author}'),
            Text('Copies available :${datareference.copies}'),
            Text('Pages :${datareference.pages}'),
          ],
        ),
      ),
    );
  }
}
