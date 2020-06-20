//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

enum UserType { individual, institution, organisation }
enum Region { region1, region2, region3 }
enum Gender { male, female }
enum Alert { wht, the }

class Formscreen extends StatefulWidget {
  
  State<StatefulWidget> createState() {
    return FormscreenState();
  }
}

class FormscreenState extends State<Formscreen> {
  
  String _fname;
  String _address;
  String _usern;
  String _lname;
  String _password;
  double _value;
  String _mob;
  String _adhar;
  String _land;
  String _cattls;
  Region _regn;
  UserType _user = UserType.individual;
  Gender _ugender = Gender.male;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _usertype() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("User Type  ", style: TextStyle(fontSize: 14)),
          DropdownButton(
            items: const <DropdownMenuItem<UserType>>[
              DropdownMenuItem<UserType>(
                child: Text("Individual"),
                value: UserType.individual,
              ),
              DropdownMenuItem<UserType>(
                child: Text("Institution"),
                value: UserType.institution,
              ),
              DropdownMenuItem<UserType>(
                child: Text("Organisation"),
                value: UserType.organisation,
              )
            ],
            onChanged: (UserType val) {
              _user = val;
              print(val);
              setState(() {
                _user = val;
              });
            },
            hint: Text("Select"),
          )
        ],
      ),
    );
  }

  Widget _regnselect() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Region  ", style: TextStyle(fontSize: 14)),
          DropdownButton(
            items: const <DropdownMenuItem<Region>>[
              DropdownMenuItem<Region>(
                child: Text("Region 1 "),
                value: Region.region1,
              ),
              DropdownMenuItem<Region>(
                child: Text("Region 2"),
                value: Region.region2,
              ),
              DropdownMenuItem<Region>(
                child: Text("Region 3"),
                value: Region.region3,
              )
            ],
            onChanged: (Region val2) {
              _regn = val2;
              print(val2);
              setState(() {
                _regn = val2;
              });
            },
            hint: Text("Select"),
          )
        ],
      ),
    );
  }

  Widget _buildadhar() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aadhar number"),
      maxLength: 16,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.length != 16) {
          return "please enter valid aadhar number";
        }
      },
      onSaved: (String value) {
        _adhar = value;
      },
    );
  }

  Widget _getland() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Land Holdigs(In Acres)"),
      maxLength: 2,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.length >= 3) {
          return "Kindly enter correct information";
        }
      },
      onSaved: (String value) {
        _adhar = value;
      },
    );
  }

  Widget _getcattlesnum() {
    return TextFormField(
      decoration: InputDecoration(labelText: "How many cattles do you own"),
      maxLength: 3,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.length == 0) {
          return "Enter number of cattles";
        }
      },
      onSaved: (String value) {
        _cattls = value;
      },
    );
  }

  Widget _gender() {
    return Container(
      child: Row(
        children: <Widget>[
          Radio<Gender>(
              groupValue: _ugender,
              value: Gender.male,
              onChanged: (Gender val) {
                _ugender = Gender.male;
                print(_ugender);
                setState(() {
                  _ugender = val;
                });
              }),
          const Text("Male"),
          Radio<Gender>(
              groupValue: _ugender,
              value: Gender.female,
              onChanged: (Gender val) {
                _ugender = Gender.female;
                print(_ugender);
                setState(() {
                  _ugender = val;
                });
              }),
          const Text("Female"),
        ],
      ),
    );
  }

  Widget _getaddr() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Adress',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is required';
          }
        },
        onSaved: (String value) {
          _address = value;
        });
  }

  Widget _buildfname() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'First Name',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is required';
          }
        },
        onSaved: (String value) {
          _fname = value;
        });
  }

  Widget _buildmob() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Mobile Number"),
      keyboardType: TextInputType.phone,
      maxLength: 10,
      validator: (String value) {
        if (value.length != 10) {
          return "Please Enter Valid mobile number";
        }
      },
      onSaved: (String value) {
        _mob = value;
      },
    );
  }

  Widget _buildlname() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Last Name',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is required';
          }
        },
        onSaved: (String value) {
          _lname = value;
        });
  }

  Widget _buildpass() {
    return Column(
      children: <Widget>[
        TextFormField(
          obscureText: true,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Password'),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is required';
            }
          },
          onSaved: (String value) {
            _password = value;
          },
        ),
        TextFormField(
          obscureText: true,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Password'),
          validator: (String value) {
            if (value != _password) {
              return 'Password does not match';
            }
          },
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Account"),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: SingleChildScrollView(
              child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '----USER INFORMATION----',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 10),
                _buildfname(),
                _buildlname(),
                _gender(),
                _buildadhar(),
                _buildmob(),
                _getaddr(),
                SizedBox(height: 25),
                Text(
                  '----OTHER INFORMATION----',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                ),
                _regnselect(),
                _usertype(),
                _getcattlesnum(),
                _getland(),
                SizedBox(height: 25),
                Text(
                  '----SET PASSWORD----',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                ),
                _buildpass(),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formkey.currentState.validate()) {
                      return;
                    }

                    _formkey.currentState.save();
                    print("\n\n\n");
                    print(_fname);
                    print(_lname);
                    print(_user);
                    print(_ugender);
                    print(_adhar);
                    print(_mob);
                    print(_password);
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Registration Succesful"),
                            content: Text("Please Log in again to continue"),
                            actions: <Widget>[
                              Center(
                                child: RaisedButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/');
                                    }),
                              )
                            ],
                          );
                        });
                  },
                )
              ],
            ),
          )),
        ));
  }
}
