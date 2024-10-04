
import 'package:flutter/material.dart';
import 'package:foodgo/models/user.dart';

class SetLocationScreen extends StatefulWidget {
  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  // Data
  late String address_user;
  final TextEditingController governorate = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController block = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController building = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController flat = TextEditingController();
  final TextEditingController avenue = TextEditingController();
  User_app user=User_app();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 28, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Location',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location, size: 28, color: Colors.red),
            onPressed: () {
              // Handle location press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Governorate
            _buildTextField('Governorate', governorate, 'Governorate'),
            SizedBox(height: 16),

            // City
            _buildTextField('City', city, 'City'),
            SizedBox(height: 16),

            // Block
            _buildTextField('Block', block, 'Block'),
            SizedBox(height: 16),

            // Street name / number
            _buildTextField('Street', street, 'Street name / number'),
            SizedBox(height: 16),

            // Building name/ number
            _buildTextField('Building', building, 'Building name/ number'),
            SizedBox(height: 16),

            // Floor (option)
            _buildTextField('Floor', floor, 'Floor (option)'),
            SizedBox(height: 16),

            // Flat (option)
            _buildTextField('Flat', flat, 'Flat (option)'),
            SizedBox(height: 16),

            // Avenue (option)
            _buildTextField('Avenue', avenue, 'Avenue (option)'),
            SizedBox(height: 16),

            // button
            Container(
              width: 327,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: MaterialButton(
                onPressed: () {
                  _onConfirmAddressPressed(context);
                },
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'Confirm Address',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller, String hintLabel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Container(
          width: 327,
          height: 56,
          color: Color(0xFFF5F5F5),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              hintText: hintLabel,
              hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onConfirmAddressPressed(BuildContext context) {
    if (governorate.text.isEmpty || city.text.isEmpty || block.text.isEmpty ||
        street.text.isEmpty || building.text.isEmpty) {
      // Show Snackbar if any required field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Concatenate all text field values into a single string
      String address =
          'Governorate: ${governorate.text},City: ${city.text},Block: ${block.text},Street: ${street.text},Building: ${building.text},Floor: ${floor.text},Flat: ${flat.text},Avenue: ${avenue.text}';

      print(address);
      // Store the address in the address_user variable
      address_user = address;
      user.address=address_user;
      print(address_user);

      // Optionally, navigate back or show a success message
      Navigator.pop(context ,address); // go to confirmorder or another screen
    }
  }
}


