import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
class YoneticiKuryeler extends StatelessWidget {
  final Query query = FirebaseFirestore.instance
      .collection("kuryeler")
      .orderBy('kullaniciAdi', descending: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kurye Listesi"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async => showDialog(
              context: context,
              child: _Dialog(),
            ),
          ),

        ],
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
                  KuryeWidget(querySnapshot.docs[index]),
            );
          },
        ),
      ),
    );
  }
}

class KuryeWidget extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const KuryeWidget(this.documentSnapshot);

  @override
  Widget build(BuildContext context) {
    print(documentSnapshot.data());
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),

      title: Text(documentSnapshot.data()['kullaniciAdi']),
      subtitle: Text("${documentSnapshot.data()['sifre'] ?? '-'}"),
    );
  }
}

class _Dialog extends StatefulWidget {
  @override
  __DialogState createState() => __DialogState();
}

class __DialogState extends State<_Dialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _adController = TextEditingController();

  final TextEditingController _sifreController = TextEditingController();




  @override
  void dispose() {
    _adController.dispose();
    _sifreController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _adController,
                decoration: InputDecoration(labelText: "Kurye Adı"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Lütfen bir kurye adı giriniz";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _sifreController,
                decoration: InputDecoration(labelText: "sifre"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Lütfen bir sifre giriniz";
                  }
                  return null;
                },
              ),

              RaisedButton(
                color: Colors.orangeAccent,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _saveKurye(context);
                  }
                },
                child: Text("Kaydet"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveKurye(BuildContext context) async {
    try {
      final String kullaniciAdi = _adController.text;
      final int sifre = int.parse(_sifreController.text);


      Map<String, dynamic> map = {
        'kullaniciAdi': kullaniciAdi,
        'sifre': sifre,

      };

      FirebaseFirestore.instance.collection("kuryeler").add(map);

      Navigator.pop(context);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}