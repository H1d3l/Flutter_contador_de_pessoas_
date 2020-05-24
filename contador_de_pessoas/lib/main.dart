import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'contador_de_pessoas', home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar";
  void _change_people(int delta){
    setState(() {
      _people+=delta;

      if(_people<0){
        _infoText = "Mundo Invertido!?";
      }else if(_people<=10){
        _infoText = "Pode Entrar";

      }else{
        _infoText = "Sem vagas";
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg", fit: BoxFit.cover, height: 1000.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        debugPrint("+1");
                        _change_people(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      )),
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                        onPressed: () {
                          debugPrint("-1");
                          _change_people(-1);
                        },
                        child: Text(
                          "-1",
                          style: TextStyle(color: Colors.white, fontSize: 40.0),
                        )))
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
