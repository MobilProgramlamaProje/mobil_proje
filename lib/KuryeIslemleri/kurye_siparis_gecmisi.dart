import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:mobil_proje/musteri_giris.dart';
import 'package:firebase_core/firebase_core.dart';

class KuryeSiparisGecmisi extends StatefulWidget {
  @override
  _KuryeSiparisGecmisiState createState() => _KuryeSiparisGecmisiState();
}

class _KuryeSiparisGecmisiState extends State<KuryeSiparisGecmisi> {
  var gelenAdres = "";
  var gelendurum = "";
  siparisGetir(){
    FirebaseFirestore.instance
        .collection("siparisler")
        .doc("siparis1")
        .get()
        .then((gelenVeri){
      setState((){
        gelenAdres = gelenVeri.data()['adres'];
        gelendurum = gelenVeri.data()['durum'];
      });
    });
  }
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children:[
              Row(
                children:[
                RaisedButton(onPressed: siparisGetir),
            ],
              ),
              ListTile(
                title: Text(gelenAdres),
                subtitle: Text(gelendurum),
              ),
            ],
            ),
          ),
        ),
      );
  }
}

