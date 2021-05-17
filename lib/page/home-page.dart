import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:taller3/page/resultados-page.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  bool _male = true;
  double _progress = 166;
  int _counter = 62;
  int _counter2 = 38;
  double listaResultado;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: false,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    bool _alreadySaved = true;
    return Column(children: [
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: _contenedorM(),
              flex: 1,
            ),
            Expanded(
              child: _contenedorF(),
              flex: 1,
            ),
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 1800,
            decoration: new BoxDecoration(
              color: Colors.black45,
              border: new Border.all(color: Colors.grey.shade900, width: 2.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(4, 4), // changes position of shadow
                ),
              ],
              borderRadius: new BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Text(
                  "Estatura",
                  style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.4)),
                ),
                Text(
                  "${_progress.toInt()} cm",
                  style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                CupertinoSlider(
                    value: _progress,
                    min: 0.0,
                    max: 350.0,
                    onChanged: (value) {
                      setState(() {
                        _progress = value.roundToDouble();
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _contenedorP(),
            flex: 1,
          ),
          Expanded(
            child: _contenedorE(),
            flex: 1,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultadosPage(
                                  edad: _counter2,
                                  estatura: _progress,
                                  peso: _counter,
                                  genero: _male,
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink.shade600,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  child: Text(
                    "Mostrar Resultados",
                    style: TextStyle(
                        fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                  )))
        ],
      )
    ]);
  }

  Widget _contenedorM() {
    return Container(
      decoration: new BoxDecoration(
        color: _male ? Colors.black26 : Colors.black45,
        border: new Border.all(color: Colors.grey.shade900, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ],
        borderRadius: new BorderRadius.circular(10.0),
      ),
      height: 200,
      child: IconButton(
          // For this situation your icon name should be humanFemale
          icon: new Icon(MdiIcons.humanMale, size: 180.0),
          onPressed: () {
            setState(() {
              _male = true;
              print(_male);
            }); //<--update alreadSaved
          }),
    );
  }

  Widget _contenedorF() {
    return Container(
      decoration: BoxDecoration(
        color: !_male ? Colors.black26 : Colors.black45,
        border: new Border.all(color: Colors.grey.shade900, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ],
        borderRadius: new BorderRadius.circular(10.0),
      ),
      height: 200,
      child: IconButton(
          // For this situation your icon name should be humanFemale
          icon: new Icon(MdiIcons.humanFemale, size: 180.0),
          onPressed: () {
            setState(() {
              _male = false;
              print(_male);
            });
          }),
    );
  }

  Widget _contenedorP() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        border: new Border.all(color: Colors.grey.shade900, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ],
        borderRadius: new BorderRadius.circular(10.0),
      ),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Peso",
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 18,
                color: Colors.white.withOpacity(0.4),
              )),
          Text(
            "${_counter}",
            style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      // This call to setState tells the Flutter framework that something has
                      // changed in this State, which causes it to rerun the build method below
                      // so that the display can reflect the updated values. If we changed
                      // _counter without calling setState(), then the build method would not be
                      // called again, and so nothing would appear to happen.
                      if (_counter > 0) {
                        _counter--;
                      }
                    });
                  },
                  tooltip: 'Increment',
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 40,
                  ),
                  backgroundColor: Colors.grey.shade700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      // This call to setState tells the Flutter framework that something has
                      // changed in this State, which causes it to rerun the build method below
                      // so that the display can reflect the updated values. If we changed
                      // _counter without calling setState(), then the build method would not be
                      // called again, and so nothing would appear to happen.
                      _counter++;
                    });
                  },
                  tooltip: 'Increment',
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                  backgroundColor: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contenedorE() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        border: new Border.all(color: Colors.grey.shade900, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ],
        borderRadius: new BorderRadius.circular(10.0),
      ),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Edad",
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 18,
                color: Colors.white.withOpacity(0.4),
              )),
          Text(
            "${_counter2}",
            style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      // This call to setState tells the Flutter framework that something has
                      // changed in this State, which causes it to rerun the build method below
                      // so that the display can reflect the updated values. If we changed
                      // _counter without calling setState(), then the build method would not be
                      // called again, and so nothing would appear to happen.
                      if (_counter2 > 0) {
                        _counter2--;
                      }
                    });
                  },
                  tooltip: 'Increment',
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 40,
                  ),
                  backgroundColor: Colors.grey.shade700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      // This call to setState tells the Flutter framework that something has
                      // changed in this State, which causes it to rerun the build method below
                      // so that the display can reflect the updated values. If we changed
                      // _counter without calling setState(), then the build method would not be
                      // called again, and so nothing would appear to happen.
                      _counter2++;
                    });
                  },
                  tooltip: 'Increment',
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                  backgroundColor: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
