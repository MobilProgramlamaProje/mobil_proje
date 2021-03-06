import 'package:flutter/material.dart';
import 'package:mobil_proje/MusteriIslemleri/musteri_urunler.dart';
import 'package:mobil_proje/MusteriIslemleri/musteri_kurye.dart';

class MusteriAnaEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Müşteri Ekranı'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,
        brightness: Brightness.light,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.blue,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Column(
              children: <Widget>[
                // the login button
                SizedBox(height:80),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/musteri.png")
                      )
                  ),
                ),
                SizedBox(height:80),
                MaterialButton(
                  minWidth: 300,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MusteriUrunler()));

                  },
                  // defining the shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Ürünler",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),
                  ),
                ),
                // creating the signup button
                SizedBox(height:20),
                MaterialButton(
                  minWidth: 300,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MusteriKurye()));

                  },
                  // defining the shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Kurye Nerede?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
