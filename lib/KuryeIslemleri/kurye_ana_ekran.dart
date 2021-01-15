import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Acer/Desktop/mobil_proje/lib/KuryeIslemleri/kurye_sirapis_ekrani.dart';

class KuryeAnaEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siparislerim',
        ),
      ),
      body: _buildListView(context),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return Card(
        child: ListTile(
          title: Text('Adres Cadde Sokak vb.'),
          subtitle: Text('$index. Sipariş '),
          leading: Icon(Icons.add_location_sharp),
          trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios_outlined),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => KuryeSiparisEkrani(index)));
          },
          ),
          ),
        );
      },
    );
  }
}