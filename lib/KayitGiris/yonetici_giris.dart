import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobil_proje/YoneticiIslemleri/yonetici_ana_ekran.dart';

//final FirebaseAuth _auth = FirebaseAuth.instance;
//FirebaseFirestore firestore = FirebaseFirestore.instance;
class YoneticiGiris extends StatelessWidget {
 /* final Query query = FirebaseFirestore.instance
      .collection("kullaniciAdi")
      .orderBy('sifre', descending: true);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _adController = TextEditingController();

  final TextEditingController _sifreController = TextEditingController();*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Yönetici Giriş",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("Hesabınıza Giriş Yapın",
                      style: TextStyle(
                          fontSize: 15,
                          color:Colors.grey[700]),)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Kullanıcı Adı"),
                      inputFile(label: "Şifre", obscureText: true)
                    ],
                  ),
                ),
                Padding(padding:
                EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration:
                    BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),

                        )



                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {

                          /*FirebaseFirestore.instance.collection("yoneticiler").get().then((snapshot) {
                            snapshot.docs.forEach((result) {
                              if (result.data()["kullaniciAdi"] != _adController.text.trim()) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Id Uyuşmuyor"),
                                ));
                              } else if (result.data()["sifre"] !=
                                  _sifreController.text.trim()) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Şifre Uymuyor"),
                                ));
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Admin Sayfasına Hoşgeldiniz" + result.data()["kullaniciAdi"]),

                                ));
                                Navigator.push(context, MaterialPageRoute(builder: (context) => YoneticiAnaEkran()));
                              }
                            });
                          }
                          );*/
                           Navigator.push(context, MaterialPageRoute(builder: (context) => YoneticiAnaEkran()));
                        },

                      color: Colors.green,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Text(
                        "Giriş", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,

                      ),
                      ),

                    ),

                  ),
                ),


                Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/yonetici.png"),
                        fit: BoxFit.fitHeight
                    ),

                  ),
                )

              ],
            ))
          ],
        ),
      ),
    );
  }

}


// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}