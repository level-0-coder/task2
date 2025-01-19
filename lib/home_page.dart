import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task2/custom_input_field.dart';
import 'package:task2/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _firstName = TextEditingController(),
      _lastName = TextEditingController(),
      _phoneNumber = TextEditingController(),
      _dob = TextEditingController(),
      _age = TextEditingController(),
      _address = TextEditingController();

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        _dob.text = DateFormat('dd/MM/yyyy').format(date);
        _age.text = (DateTime.now().year - date.year).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomInputField(
                    label: 'First Name*',
                    hint: 'Enter first name',
                    textEditingController: _firstName,
                    expand: true,
                  ),
                  CustomInputField(
                    label: 'Last Name*',
                    hint: 'Enter last name',
                    textEditingController: _lastName,
                    expand: true,
                  ),
                ],
              ),
              CustomInputField(
                label: 'Phone Number*',
                hint: 'Enter Phone Number',
                textEditingController: _phoneNumber,
                dataType: TextInputType.numberWithOptions(
                  signed: false,
                  decimal: false,
                ),
              ),

              // custom date field
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          'Date Of Birth*',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.none,
                        controller: _dob,
                        decoration: InputDecoration(
                          hintText: 'Enter date of birth',
                          // label: Text('FirstName'),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onTap: () {
                          _pickDate();
                        },
                      ),
                    ]),
              ),

              CustomInputField(
                label: 'Age*',
                hint: 'Enter age',
                textEditingController: _age,
                dataType: TextInputType.number,
              ),
              CustomInputField(
                label: 'Address*',
                hint: 'Enter address',
                textEditingController: _address,
                dataType: TextInputType.streetAddress,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_firstName.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Enter First Name"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else if (_lastName.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Enter Last Name"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else if (_phoneNumber.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Enter Phone Number"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else if (_dob.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Enter Date Of Birth"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else if (_age.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Enter Age"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else if (_address.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Enter Address"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfilePage(
                                name: '${_firstName.text} ${_lastName.text}',
                                phoneNumber: _phoneNumber.text.toString(),
                                dob: _dob.text.toString(),
                                age: _age.text.toString(),
                                address: _address.text.toString(),
                              );
                            },
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
