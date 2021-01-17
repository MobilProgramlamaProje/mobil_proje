import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
class YoneticiUrunler extends StatelessWidget {
  final Query query = FirebaseFirestore.instance
      .collection("urunler")
      .orderBy('fiyat', descending: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Listesi"),
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

class _Dialog extends StatefulWidget {
  @override
  __DialogState createState() => __DialogState();
}

class __DialogState extends State<_Dialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _adController = TextEditingController();

  final TextEditingController _fiyatController = TextEditingController();

  final TextEditingController _imageController = TextEditingController();


  @override
  void dispose() {
    _adController.dispose();
    _fiyatController.dispose();
    _imageController.dispose();
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
                decoration: InputDecoration(labelText: "Urun Adı"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Lütfen bir urun adı giriniz";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fiyatController,
                decoration: InputDecoration(labelText: "Fiyat"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Lütfen bir fiyat giriniz";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: "Urun Fotoğrafı"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Lütfen bir ürün url giriniz";
                  }
                  return null;
                },
              ),
              RaisedButton(
                color: Colors.orangeAccent,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _saveUrun(context);
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

  void _saveUrun(BuildContext context) async {
    try {
      final String ad = _adController.text;
      final int fiyat = int.parse(_fiyatController.text);
      final String image = _imageController.text;

      Map<String, dynamic> map = {
        'ad': ad,
        'fiyat': fiyat,
        'image': image,
      };

      FirebaseFirestore.instance.collection("urunler").add(map);

      Navigator.pop(context);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}