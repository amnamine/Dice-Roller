import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiceRoller(),
    );
  }
}

class DiceRoller extends StatefulWidget {
  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int _selectedDice = 6; // Default to D6

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<int>(
              value: _selectedDice,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedDice = newValue!;
                });
              },
              items: <int>[4, 6, 8, 10, 12, 20].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('D$value'),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rollDice,
              child: Text('ROLL'),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_diceResult',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  int _diceResult = 0;

  void _rollDice() {
    setState(() {
      _diceResult = _generateRandomNumber(_selectedDice);
    });
  }

  int _generateRandomNumber(int sides) {
    final random = Random();
    return random.nextInt(sides) + 1;
  }
}
