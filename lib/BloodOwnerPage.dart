import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BloodOwnersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blood Donors')),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('blood_donors').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final donors = snapshot.data!.docs;
          return ListView.builder(
            itemCount: donors.length,
            itemBuilder: (context, index) {
              final donor = donors[index];
              return ListTile(
                title: Text(donor['name']),
                subtitle: Text(
                    'Place: ${donor['place']} \nPhone: ${donor['phone']} \nBlood Group: ${donor['bloodGroup']}'),
              );
            },
          );
        },
      ),
    );
  }
}
