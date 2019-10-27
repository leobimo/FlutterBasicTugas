import 'package:flutter/material.dart';
import 'Detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarPahlawan = new List();

  var karakter = [
    {"nama": "Amir Sjarifoeddin", "gambar": "amir.jpeg"},
    {"nama": "Soenario", "gambar": "Soenario.jpg"},
    {"nama": "Sugondo", "gambar": "Sugondo.jpg"},
    {"nama": "Johannes Leimena", "gambar": "Johannes_Leimena.jpg"},
    {"nama": "Djoko Marsaid", "gambar": "djoko.jpg"},
    {"nama": "Mohammad Yamin", "gambar": "myamin.jpg"},
    {"nama": "W.R Supratman", "gambar": "wrsupratman.jpg"},
    {"nama": "S.Mangunsarkoro", "gambar": "mangunsarkoro.jpg"},
    {"nama": "Kartosoewirdjo", "gambar": "kartosoewirdjo.png"},
    {"nama": "Kasman Singodimedjo", "gambar": "kasman.jpeg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];

      daftarPahlawan.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
              child: new Column(
                children: <Widget>[
                  new Hero(
                    tag: karakternya['nama'],
                    child: new Material(
                      child: new InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Detail(
                                nama: karakternya['nama'],
                                gambar: gambar,
                              ),
                            )),
                        child: new Image.asset(
                          "img/$gambar",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(10.0),
                  ),
                  new Text(
                    karakternya['nama'],
                    style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                  )
                ],
              ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Sumpah Pemuda 28 Oktober",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarPahlawan,
      ),
    );
  }
}
