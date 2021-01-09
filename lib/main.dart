import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      '/second': (context) => SecondRoute(),
      '/third': (context) => ThirdRoute(),
      '/fourth': (context) => FourthRoute(),
    },
  ));
}

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData( primarySwatch: Colors.red, ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 60,
            title: Text('SüperMarketim'),
          ),
          backgroundColor: Colors.grey,
          body: Center( child: Column( children: <Widget>[
            Container(
              margin: EdgeInsets.all(50),
              width: 250,
              height: 55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.blue],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),

              child : FlatButton(
                child: Text('Yönetici',  style: TextStyle(color: Colors.lime[50]),),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(50),
              width: 250,
              height: 55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.blue],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),



              child : FlatButton(
                child: Text('Kurye',  style: TextStyle(color: Colors.lime[50]),),
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
              ),
            ),

            Container(
              margin: EdgeInsets.all(50),
              width: 250,
              height: 55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.blue],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),

              child : FlatButton(
                child: Text('Kullanıcı',  style: TextStyle(color: Colors.lime[50]),),
                onPressed: () {
                  Navigator.pushNamed(context, '/fourth');
                },
              ),
            ),
          ],

          ))),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YÖNETİCİ "),
        backgroundColor: Colors.purple[900],
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KURYE"),
        backgroundColor: Colors.purple[700],
      ),
    );
  }
}



class FourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KULLANICI"),
        backgroundColor: Colors.purple[500],
      ),
    );
  }
}
