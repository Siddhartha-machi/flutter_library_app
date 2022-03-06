import 'package:flutter/material.dart';
import 'package:libraryapp/models/database.dart';
import 'package:provider/provider.dart';

import '../screens/conformation_screen.dart';

class FormCard extends StatefulWidget {
  static const routename = '/form';

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  final _formKey = GlobalKey<FormState>();
  Map<String, Object> inputresponses = {};

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
          return value == '' ? 'Provide some input!' : validityhandler(value);
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
          labelText: isrequired ? '$title $htext * ' : '$title $htext',
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
    final studentdatahandler =
        Provider.of<StudentAuthenticationData>(context).addtolist;
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
                  inputresponses.addAll({'Name': inputvalue});
                  return null;
                },
              ),
              buildformwidget(
                context,
                'ID Number',
                TextInputType.number,
                (String inputvalue) {
                  var year;
                  try {
                    year = int.parse(inputvalue).toString();
                  } catch (error) {
                    return 'Not a valid value';
                  }
                  if (year.length != 10) {
                    return 'ID year should have a length 10';
                  }
                  inputresponses.addAll({'ID': inputvalue});
                  return null;
                },
              ),
              buildformwidget(
                context,
                'Studying Year',
                TextInputType.number,
                (String inputvalue) {
                  // print(inputvalue);
                  var year;
                  try {
                    year = int.parse(inputvalue);
                  } catch (error) {
                    return 'Not a valid value';
                  }
                  if (year > 4 || year <= 0) {
                    return ' Year $year doesn\'t exist!';
                  }
                  inputresponses.addAll({'Year': year});
                  return null;
                },
              ),
              buildformwidget(
                context,
                'Department',
                TextInputType.text,
                (String inputvalue) {
                  final val1;
                  final val2;
                  // print(inputvalue);
                  try {
                    if (inputvalue.toLowerCase() == inputvalue) {
                      return 'Invalid department';
                    }
                    val1 = int.tryParse(inputvalue);
                    val2 = double.tryParse(inputvalue);
                  } catch (error) {
                    return 'Invalid department';
                  }
                  if (val1 != null || val2 != null) {
                    return 'Invalid department';
                  }
                  if (inputvalue.length != 3) {
                    return 'Department name should be 3 characters long only!';
                  }
                  inputresponses.addAll({'Department': inputvalue});
                  return null;
                },
                'Eg : CSE',
              ),
              buildformwidget(
                context,
                'Email Address',
                TextInputType.emailAddress,
                (String inputvalue) {
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(inputvalue)) {
                    return 'Gmail Format or Domain is wrong!';
                  }
                  inputresponses.addAll({'Email': inputvalue});
                  return null;
                },
              ),
              buildformwidget(
                context,
                'Mobile Number',
                TextInputType.phone,
                (String inputvalue) {
                  // print(inputvalue);
                  var year;
                  try {
                    year = int.parse(inputvalue);
                  } catch (error) {
                    return '\'$inputvalue\' Not a valid value';
                  }
                  if (year.toString().length > 10 || year.toString().isEmpty) {
                    return 'Number should be 10 digits long!';
                  }
                  inputresponses.addAll({'Mobile': inputvalue});
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
                  if (inputvalue.length == 8 || inputvalue.length == 10) {
                    inputresponses.addAll({'DOB': inputvalue});
                    return null;
                  }
                  return 'Not a valid format';
                },
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: buildbutton('Reset', () {
                      _formKey.currentState!.reset();
                    }, Colors.blue),
                  ),
                  Expanded(
                    flex: 2,
                    child: buildbutton('Register', () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        studentdatahandler(inputresponses);
                        Navigator.of(context).pushReplacementNamed(
                            ConformationPageScreen.routename);
                      }
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
