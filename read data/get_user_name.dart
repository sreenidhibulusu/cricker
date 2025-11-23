import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  const GetUserName({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final criminals = FirebaseFirestore.instance.collection('criminals');

    return FutureBuilder<DocumentSnapshot>(
      future: criminals.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text('Record not found');
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        final name = data['name'] ?? 'Unknown';
        final criminalId = data['criminalid'] ?? '';

        return Text('$name  $criminalId');
      },
    );
  }
}
