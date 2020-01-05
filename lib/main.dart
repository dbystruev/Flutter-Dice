import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.red,
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _leftDiceNumber;
  int _rightDiceNumber;
  Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Image.asset('images/dice$_leftDiceNumber.png'),
                  onPressed: _rollDice,
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Image.asset('images/dice$_rightDiceNumber.png'),
                  onPressed: _rollDice,
                ),
              ),
            ],
          ),
          flex: 3,
        ),
        Expanded(
          child: Text(
            '${_leftDiceNumber + _rightDiceNumber}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 75,
            ),
          ),
          flex: 2,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  void initState() {
    super.initState();
    _rollDice();
  }

  void _rollDice() {
    setState(() {
      _leftDiceNumber = _random.nextInt(6) + 1;
      _rightDiceNumber = _random.nextInt(6) + 1;
    });
  }
}
