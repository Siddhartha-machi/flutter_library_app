import 'package:flutter/cupertino.dart';

import '../models/element_datails.dart';

class Data with ChangeNotifier {
  final List<ElementDetails> _archive = [
    ElementDetails(
        author: 'Herbert  Schildt',
        copies: 10,
        id: '001',
        price: 356.45,
        title: 'The Complete Reference to C',
        imagesource: 'assets/images/c_language.jpg',
        pages: 500,
        assettype: true),
    ElementDetails(
        author: 'Thomas H. Cormen',
        copies: 5,
        id: '002',
        price: 1200,
        title: 'Introduction to Algorithms',
        imagesource: 'assets/images/ds.jpg',
        pages: 1350,
        assettype: true),
    ElementDetails(
        author: 'Abraham Silberschatz',
        copies: 12,
        id: '003',
        price: 300,
        title: 'Operating System Concepts',
        imagesource: 'assets/images/os.jpg',
        pages: 900,
        assettype: true),
    ElementDetails(
        author: 'Safa Hamdare',
        copies: 15,
        id: '004',
        price: 450,
        title: 'Database Managemant Systems',
        imagesource: 'assets/images/dbms.jpg',
        pages: 850,
        assettype: true),
  ];

  List<ElementDetails> get viewlist {
    return [..._archive];
  }

  void addtolist(ElementDetails entry) {
    _archive.add(entry);
    notifyListeners();
  }

  ElementDetails getitem(String id) {
    return _archive.firstWhere((element) => element.id == id);
  }
}
