import 'package:flutter/material.dart';
import 'package:libraryapp/models/database.dart';
import 'package:provider/provider.dart';

import './screens/form.dart';
import './screens/drawer.dart';
import './screens/login_screen.dart';
import './screens/archive_screen.dart';
import './screens/archive_item_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => Data(),
      ),
      ChangeNotifierProvider.value(value: Data()),
    ],
    child: MaterialApp(
      initialRoute: RegistrationPage.routename,
      routes: {
        RegistrationPage.routename: (context) => RegistrationPage(),
        FormCard.routename: (context) => FormCard(),
        LoginScreen.routename: (context) => LoginScreen(),
        ArchiveScreen.routename: (context) => ArchiveScreen(),
        ArchiveItemScreen.routename: (context) => ArchiveItemScreen(),
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
      return Container(
        width: double.infinity,
        child: ElevatedButton(
          child: Text(title),
          onPressed: () {
            Navigator.pushNamed(context, screensrc);
          },
        ),
      );
    }

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Library Online'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 153, 255, 0.3),
          ),
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
