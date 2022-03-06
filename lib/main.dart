import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './screens/form.dart';
import './screens/drawer.dart';
import './screens/login_screen.dart';
import './screens/archive_screen.dart';
import './screens/archive_item_screen.dart';
import './screens/conformation_screen.dart';
import 'package:libraryapp/models/database.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: Data()),
      ChangeNotifierProvider.value(value: StudentAuthenticationData()),
    ],
    child: MaterialApp(
      initialRoute: RegistrationPage.routename,
      routes: {
        RegistrationPage.routename: (context) => RegistrationPage(),
        FormCard.routename: (context) => FormCard(),
        LoginScreen.routename: (context) => LoginScreen(),
        ArchiveScreen.routename: (context) => ArchiveScreen(),
        ArchiveItemScreen.routename: (context) => ArchiveItemScreen(),
        ConformationPageScreen.routename: (context) => ConformationPageScreen()
      },
      theme: ThemeData(
        primaryColor: Colors.cyan.shade300,
        primarySwatch: Colors.teal,
        backgroundColor: Colors.teal.shade100,
      ),
    ),
  ));
}

class RegistrationPage extends StatelessWidget {
  static const routename = '/';

  @override
  Widget build(BuildContext context) {
    Widget BuildButton(String title, String screensrc) {
      // final handler = Provider.of<StudentAuthenticationData>(context);
      // final datahandler = Provider.of<Data>(context);
      // handler.printdetails;
      // print(datahandler.viewlist);
      return Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: ElevatedButton(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(screensrc);
          },
        ),
      );
    }

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Library Online'),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          child: Column(
            children: [
              BuildButton('Register', FormCard.routename),
              BuildButton('Archives', ArchiveScreen.routename),
            ],
          ),
        ),
      ),
    );
  }
}
