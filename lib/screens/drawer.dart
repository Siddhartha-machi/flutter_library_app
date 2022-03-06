import 'dart:ui';

import 'package:flutter/material.dart';

import './form.dart';
import '../main.dart';
import './archive_screen.dart';

class DrawerWidget extends StatelessWidget {
  Widget menulistTile(
      context, String title, Widget iconvalue, String reference, bool type) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Theme.of(context).primaryColor,
        child: ListTile(
          onTap: () {
            if (reference == '') {
              Navigator.of(context).pop();
            } else {
              type
                  ? Navigator.of(context).pushNamed(reference)
                  : Navigator.of(context).pushReplacementNamed(reference);
            }
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
          menulistTile(
            context,
            'Home',
            const Icon(Icons.home),
            RegistrationPage.routename,
            false,
          ),
          menulistTile(
              context,
              'Register',
              const Icon(Icons.app_registration_outlined),
              FormCard.routename,
              true),
          menulistTile(
            context,
            'Archive',
            const Icon(Icons.archive_rounded),
            ArchiveScreen.routename,
            true,
          ),
          menulistTile(
            context,
            'Exit',
            const Icon(Icons.logout),
            '',
            true,
          ),
        ],
      ),
    );
  }
}
