import 'dart:ui';

import 'package:flutter/material.dart';

import './form.dart';
import '../main.dart';
import './login_screen.dart';
import './archive_screen.dart';

class DrawerWidget extends StatelessWidget {
  Widget MenulistTile(
      context, String title, Widget iconvalue, String reference, bool type) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Theme.of(context).primaryColor,
        child: ListTile(
          onTap: () {
            type
                ? Navigator.of(context).pushNamed(reference)
                : Navigator.of(context).pushReplacementNamed(reference);
          },
          leading: iconvalue,
          title: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 300,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blueGrey.shade100,
            width: double.infinity,
            child: Text(
              'Library online',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          MenulistTile(
            context,
            'Home',
            const Icon(Icons.home),
            RegistrationPage.routename,
            false,
          ),
          MenulistTile(
              context,
              'Register',
              const Icon(Icons.app_registration_outlined),
              FormCard.routename,
              true),
          MenulistTile(
            context,
            'Archive',
            const Icon(Icons.archive_rounded),
            ArchiveScreen.routename,
            true,
          ),
          MenulistTile(
            context,
            'Login',
            const Icon(Icons.login),
            LoginScreen.routename,
            true,
          ),
          MenulistTile(
            context,
            'Exit',
            const Icon(Icons.logout),
            FormCard.routename,
            true,
          ),
        ],
      ),
    );
  }
}
