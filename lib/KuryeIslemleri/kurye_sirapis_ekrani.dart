import 'package:flutter/material.dart';

class KuryeSiparisEkrani extends StatelessWidget {
  final int index;

  KuryeSiparisEkrani(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Adres:'),
        ),
        body: Center(
        ),
    );
  }
}

