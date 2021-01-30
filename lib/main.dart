import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Contador de pessoas', home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _info = 'Pode entrar';

  void _alterPeople(int numb) {
    setState(() {
      _people += numb;

      if (_people < 0) {
        _info = 'Numero inválido de pessoas';
      } else if (_people <= 10) {
        _info = 'Capacidade : OK!';
      } else {
        _info = 'lotação excedida. Evite Aglomerações!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'images/restaurant.jpg',
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Pessoas $_people',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  child: Text(
                    '+1',
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                  onPressed: () {
                    _alterPeople(1);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  child: Text(
                    '-1',
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                  onPressed: () {
                    _alterPeople(-1);
                  },
                ),
              ),
            ],
          ),
          Text(
            _info,
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
          ),
        ],
      )
    ]);
  }
}
