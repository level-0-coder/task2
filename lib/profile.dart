import 'package:flutter/material.dart';
import 'package:task2/custom_profile_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.dob,
    required this.age,
    required this.address,
  });

  final String name, phoneNumber, dob, age, address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'These are the details you\'ve provided while sign up process.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            color: Colors.blue.shade100,
                            size: 100,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomProfileField(
                            label: 'Phone Number',
                            value: phoneNumber,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomProfileField(
                            label: 'Date Of Birth',
                            value: dob,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomProfileField(
                            label: 'Age',
                            value: age,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomProfileField(
                            label: 'Address',
                            value: address,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
