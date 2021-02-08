import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:mobil_proje/musteri_giris.dart';
import 'package:firebase_core/firebase_core.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;
class YoneticiSiparisler extends StatefulWidget {
  YoneticiSiparisler();
  @override
  YoneticiSiparislerState createState() => YoneticiSiparislerState();
}

class YoneticiSiparislerState extends State<YoneticiSiparisler> {
  YoneticiSiparislerState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: StreamBuilder(
          stream: firestore.collection('siparisler').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Text("  " + document['adres'] + " " +  document['durum'] ),
                  ),
                );
              }).toList(),
            );
          }
      ),
    );
  }
}