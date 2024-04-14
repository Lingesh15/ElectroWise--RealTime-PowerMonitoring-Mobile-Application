// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, must_be_immutable, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final List<String> list;
  const NewPage({required this.list, super.key});
  @override
  Widget build(BuildContext context) {
    String val = list[list.length - 1];
    String intValue3 = "0";
    String tot;
    double intValue = double.parse(val);
    double ED = intValue * 0.15;
    double FC = 45.0;
    if (intValue < 100) {
      intValue = 0;
      intValue3 = "100";
    }
    if (intValue < 200 && intValue > 100) {
      intValue = ((intValue - 100) * 2);
      intValue3 = "200";
    }
    if (intValue < 300 && intValue > 200) {
      double intValue1 = intValue - 200;
      double intValue2 = intValue - 100 - intValue1;
      intValue = ((intValue1 * 3) + (intValue2 * 2));
      intValue3 = "300";
    }
    tot = (intValue).toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expected Bill',
          style: TextStyle(
              fontFamily: 'Teko', fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            // Position from thebottom
            right: 10,
            left: 10,
            top: 20,
            bottom: 20, // Position from the right
            child: Container(
              width: 400,
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      'Bill Amount:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: Text(
                      'Power consumed: ' + list[list.length - 1] + ' kwh',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 20,
                    child: Text(
                      'Charges For Consumption:',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 20,
                    child: Text(
                      'Below ' + intValue3 + ' Units: Rs.' + tot,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    right: 10,
                    left: 10,
                    child: Container(
                      width: 400, // Adjust width as needed
                      child: Divider(
                        color: Colors.black,
                        thickness: 1, // Adjust thickness as needed
                        indent: 10, // Adjust left padding as needed
                        endIndent: 10, // Adjust right padding as needed
                      ),
                    ),
                  ),
                  Positioned(
                    top: 220,
                    left: 20,
                    child: Text(
                      'TOTAL: Rs.' + tot,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
