import 'dart:math';

import 'package:flutter/material.dart';

class ResultadosPage extends StatelessWidget {
  final int edad, peso;
  final double estatura;
  final bool genero;
  String resultado = "", mensaje = "";
  double valor = 0;
  Color color = Colors.white;

  ResultadosPage({this.edad, this.peso, this.estatura, this.genero});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: false,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    _calculo();
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
          child: Text(
            "Resultado",
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade900,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "$resultado",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                ),
                Center(
                  child: Text(
                    "$valor",
                    style: TextStyle(fontSize: 75, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "$mensaje",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pink.shade600,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    child: Text(
                      "Mostrar Resultados",
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold),
                    )))
          ],
        )
      ],
    );
  }

  void _calculo() {
    valor = pow((estatura / 100), 2);
    valor = peso / valor;
    valor = double.parse(valor.toStringAsFixed(1));
    if (valor < 18.5) {
      resultado = "Bajo Peso".toUpperCase();
      mensaje = "Se encuentra en un peso bajo para los datos ingresados";
      color = Colors.yellow;
    } else if (valor < 24.9) {
      resultado = "Peso Normal".toUpperCase();
      mensaje = "Tiene un peso ideal para los datos ingresados";
      color = Colors.green;
    } else if (valor < 29.9) {
      resultado = "Sobrepeso".toUpperCase();
      mensaje = "Se encuentra con un peso relativamente alto para sus datos ";
      color = Colors.yellow;
    } else if (valor < 34.5) {
      resultado = "Obesidad Grado I".toUpperCase();
      mensaje = "Estado de obesidad grado I no adecuado";
      color = Colors.amber;
    } else if (valor < 39.9) {
      resultado = "Obesidad Grado II".toUpperCase();
      mensaje = "Su sobrepeso esta en grado II. Alerta!";
      color = Colors.orange;
    } else {
      resultado = "Obesidad Grado III".toUpperCase();
      mensaje = "Se envuentra en obesidad mórbida o extrema";
      color = Colors.red;
    }
  }
}
