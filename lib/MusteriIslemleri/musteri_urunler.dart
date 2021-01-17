import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
class MusteriUrunler extends StatelessWidget {
  final Query query = FirebaseFirestore.instance
      .collection("urunler")
      .orderBy('fiyat', descending: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Urunler"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: query.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Icon(Icons.error),
              );
            }
            final QuerySnapshot querySnapshot = snapshot.data;
            return ListView.builder(
              itemCount: querySnapshot.size,
              itemBuilder: (context, index) =>
                  UrunWidget(querySnapshot.docs[index]),
            );
          },
        ),
      ),
    );
  }
}

class UrunWidget extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const UrunWidget(this.documentSnapshot);

  @override
  Widget build(BuildContext context) {
    print(documentSnapshot.data());
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      leading: documentSnapshot.data()['image'] == null
          ? SizedBox.shrink()
          : Image.network(documentSnapshot.data()['image']),
      title: Text(documentSnapshot.data()['ad']),
      subtitle: Text("${documentSnapshot.data()['fiyat'] ?? '-'}"),
    );
  }
}

