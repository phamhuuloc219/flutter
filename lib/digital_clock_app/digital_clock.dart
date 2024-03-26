import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late String clock;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1),(timer){
      var formatter = new DateFormat('jms');
      setState(() {
        clock = formatter.format(DateTime.now());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digital Clock"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          child: Text(
            "$clock",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
