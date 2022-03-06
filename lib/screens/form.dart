import 'package:flutter/material.dart';

import '../models/student_form.dart';

class FormCard extends StatefulWidget {
  static const routename = '/form';
  var _response;

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> inputresponses = {};

  Widget buildformwidget(
      ctx, String title, keyboardtypevalue, Function validityhandler,
      [String htext = '', bool isrequired = true]) {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
          )),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (value) {
          return value == null ? 'Provide some input!' : validityhandler(value);
          // if (value == null) {
          //   return 'Provide some input!';
          // }
          // inputresponses.addAll({'Name':value});
          // return validityhandler(inputresponses);
        },
        keyboardType: keyboardtypevalue,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          labelText: isrequired ? '$title * $htext' : '$title $htext',
          fillColor: Theme.of(ctx).primaryColor,
        ),
      ),
    );
    ;
  }

  Widget buildbutton(String title, VoidCallback handler, Color buttoncolor) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 75,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => buttoncolor),
        ),
        onPressed: handler,
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Portal'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Student Registration',
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              buildformwidget(
                context,
                'Full Name',
                TextInputType.name,
                (String inputvalue) {
                  if (inputvalue.length <= 6) {
                    return 'Name should be atleast 6 characters long!';
                  }
                  return null;
                },
              ),
              buildformwidget(
                context,
                'ID Number',
                TextInputType.number,
                (String inputvalue) {
                  var number;
                  try {
                    number = int.parse(inputvalue).toString();
                  } catch (error) {
                    return 'Not a valid value';
                  }
                  if (number.length > 10) {
                    return 'ID number should have a length 10';
                  }

                  return null;
                },
              ),
              buildformwidget(
                context,
                'Studying Year',
                TextInputType.number,
                (String inputvalue) {
                  // print(inputvalue);
                  var number;
                  try {
                    number = int.parse(inputvalue);
                  } catch (error) {
                    return 'Not a valid value';
                  }
                  if (number > 4 || number <= 0) {
                    return '$number year doesn\'t exist!';
                  }

                  return null;
                },
              ),
              buildformwidget(
                context,
                'Department',
                TextInputType.text,
                (String inputvalue) {
                  // print(inputvalue);

                  if (inputvalue.length != 3) {
                    return 'Department name should be 3 characters long only!';
                  }
                  return null;
                },
                'Eg : CSE',
              ),
              buildformwidget(
                context,
                'Email Address',
                TextInputType.emailAddress,
                (String inputvalue) {
                  if (inputvalue.length <= 5 ||
                      inputvalue.contains('@gmail.com')) {
                    return 'Gmail Format or Domain is wrong!';
                  }
                  return null;
                },
              ),
              buildformwidget(
                context,
                'Mobile Number',
                TextInputType.phone,
                (String inputvalue) {
                  print(inputvalue);
                  var number;
                  try {
                    number = int.parse(inputvalue);
                  } catch (error) {
                    return '$number Not a valid value';
                  }
                  if (number > 10 || number <= 0) {
                    return 'Number should be 10 digits long!';
                  }

                  return null;
                },
                '',
                false,
              ),
              buildformwidget(
                context,
                'Date of Birth',
                TextInputType.datetime,
                (String inputvalue) {
                  print(inputvalue);

                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: buildbutton('Reset', () {
                      print('Reset button is clicked!');
                    }, Colors.blue),
                  ),
                  Expanded(
                    flex: 2,
                    child: buildbutton('Register', () {
                      _formKey.currentState!.validate();
                    }, Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
