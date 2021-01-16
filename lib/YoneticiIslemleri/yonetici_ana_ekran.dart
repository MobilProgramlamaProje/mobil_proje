import 'package:flutter/material.dart';
import 'package:mobil_proje/YoneticiIslemleri/yonetici_urunler.dart';
import 'package:mobil_proje/YoneticiIslemleri/yonetici_kuryeler.dart';
import 'package:mobil_proje/YoneticiIslemleri/yonetici_siparisler.dart';

class YoneticiAnaEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Yönetici Ekranı'),
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
            color: Colors.black,
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
                SizedBox(height:20),
                MaterialButton(
                  minWidth: 300,
                  height: 60,
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => YoneticiUrunler()));

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
                   Navigator.push(context, MaterialPageRoute(builder: (context) => YoneticiSiparisler()));

                  },
                  // defining the shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Siparişler",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),
                  ),
                ),
                SizedBox(height:20),
                MaterialButton(
                  minWidth: 300,
                  height: 60,

                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => YoneticiKuryeler()));

                  },
                  // defining the shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Kuryeler",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),
                  ),
                ),
                SizedBox(height:20),
                MaterialButton(
                  minWidth: 300,
                  height: 60,
                  onPressed: () {

                  },
                  // defining the shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Siparişler Nerede?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/yonetici2.png")
                      )
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
