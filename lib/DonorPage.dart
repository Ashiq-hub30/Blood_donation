import 'package:blood_donation_app/BloodOwnerPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorPage extends StatefulWidget {
  const DonorPage({super.key});

  @override
  _DonorPageState createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  final _nameController = TextEditingController();
  final _placeController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _bloodGroup;

  void _addDonor() async {
    if (_nameController.text.isNotEmpty && _bloodGroup != null) {
      await FirebaseFirestore.instance.collection('blood_donors').add({
        'name': _nameController.text,
        'place': _placeController.text,
        'phone': _phoneController.text,
        'bloodGroup': _bloodGroup,
      });
      _nameController.clear();
      _placeController.clear();
      _phoneController.clear();
      setState(() {
        _bloodGroup = null; // Reset blood group
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Donor added!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Blood Donor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _placeController,
              decoration: InputDecoration(labelText: 'Place'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone No.'),
              keyboardType: TextInputType.phone,
            ),
            DropdownButton<String>(
              hint: Text('Select Blood Group'),
              value: _bloodGroup,
              onChanged: (String? newValue) {
                setState(() {
                  _bloodGroup = newValue;
                });
              },
              items: <String>['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _addDonor,
              child: Text('Add Donor'),
            ),
            SizedBox(height: 16), // Add some space
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BloodOwnersPage()),
                );
              },
              child: Text('View Blood Donors'),
            ),
          ],
        ),
      ),
    );
  }
}
