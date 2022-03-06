import 'package:flutter/material.dart';

class ConformationPageScreen extends StatelessWidget {
  static const routename = '/confirm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conformation Page'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Column(
            children: [
              const SizedBox(
                width: 100,
                height: 100,
                child: Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Colors.green,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Registered Successfully',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.home),
                  label: const Text("Go back Home"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
