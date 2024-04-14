// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, library_private_types_in_public_api, use_rethrow_when_possible, use_key_in_widget_constructors, sized_box_for_whitespace, unused_import, unused_local_variable, prefer_const_literals_to_create_immutables

import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import './calc.dart';
import './api/firebase_api.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    readData();
  }

  bool isLoading = true;
  List<String> list = [];
  List<DateTime> dates = [];
  List<double> doubleList = [0];

  /*Future<void> readData() async {
    var url =
        "https://flutter-chat-app-a814f-default-rtdb.asia-southeast1.firebasedatabase.app/"
        "data.json";
    // Do not remove “data.json”, keep it as it is
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((blogId, blogData) {
        date.add(blogId);
        list.add(blogData["kwh"]);
      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }*/

  Future<void> readData() async {
    var url = "https://esp32ht-default-rtdb.firebaseio.com/dateDB.json";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        extractedData.forEach((date, kwhValue) {
          DateTime parsedDate = DateTime.parse(date);
          dates.add(parsedDate);
          list.add(kwhValue.toString());
        });

        // Check if the widget is still mounted before calling setState

        setState(() {
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    doubleList = list.isNotEmpty
        ? list.map((item) => double.parse(item)).toList()
        : doubleList;
    String val = list.isNotEmpty ? list[list.length - 1] : 'Loading';
    String tot;
    String title = "OVer Consumption Alert";
    String body = "Your bill is more than 100";
    String token =
        'euqLgZ7DQOO7fc5WeMoy-y:APA91bHI6n4-j9FtOZ1dcvQn2jSdaON3zauHGgz8mseTYFUX0doeGR-H_6SevunLFiniCUxb8IdVUoGCQOLqpBersz6lJGjq38_S9tLULLDxH2yzjjfYTzMYmGZxOBTIVaLqY1rneBjr';

    List<DateTime> dates2 = [
      DateTime.parse('2024-04-09'),
      DateTime.parse('2024-04-13'),
      DateTime.parse('2024-04-14'),
    ];
    List<double> doubleList2 = [0.024, 0.045, 0.088];

    if (val != "Loading") {
      double intValue = double.parse(val);
      double ED = intValue * 0.15;
      double FC = 45.0;
      if (intValue < 100) {
        intValue = 0;
        sendNotification(token, title, body);
      }
      if (intValue < 200 && intValue > 100) {
        intValue = ((intValue - 100) * 2);
      }
      if (intValue < 300 && intValue > 200) {
        double intValue1 = intValue - 200;
        double intValue2 = intValue - 100 - intValue1;
        intValue = ((intValue1 * 3) + (intValue2 * 2));
      }
      tot = (intValue).toString();

      if (double.parse(tot) > 40) {
        sendNotification(token, title, body);
      }
    } else {
      tot = val;
    }

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        title: const Text(
          'Dashboard',
          style: TextStyle(
              fontFamily: 'Teko', fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.exit_to_app_rounded))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Positioned(
              top: 20, // Position from the top
              left: 20,
              right: 20, // Position from the left
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 10,
                      child: Container(
                        width: 130,
                        height: 130,
                        child: Image.asset(
                          "asstes/images/undraw_electricity_k2ft.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 150,
                      child: Text(
                        'Power Consumed:',
                        style: TextStyle(
                            fontFamily: 'Teko',
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 235,
                      child: Text(
                        list.isNotEmpty
                            ? "${list[list.length - 1]} kwh"
                            : "Loading...",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Teko',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // Position from the bottom
              right: 20,
              left: 20,
              top: 180, // Position from the right
              child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                    onTap: () {
                      // Navigate to the new page when the container is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewPage(list: list)),
                      );
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 30,
                          child: Container(
                            width: 130,
                            height: 120,
                            child: Image.asset(
                              "asstes/images/undraw_Finance_re_gnv2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 210,
                          child: SizedBox(
                            width: 140, // Adjust width as needed
                            child: Text(
                              'Expected Bill :',
                              style: TextStyle(
                                fontFamily: 'Teko',
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 90,
                          left: 210,
                          child: SizedBox(
                            width: 120, // Adjust width as needed
                            child: Text(
                              'Rs.$tot',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Positioned(
              top: 345, // Position from the top
              left: 20,
              right: 20,
              bottom: 50, // Position from the left
              child: Container(
                width: 150,
                height: 550,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey,
                            strokeWidth: 0.5,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true, // Show bottom titles
                          getTitles: (value) {
                            int index = value.toInt();
                            if (index >= 0 && index < dates.length) {
                              String dayMonth =
                                  '${dates[index].day}/${dates[index].month}';
                              return dayMonth;
                            }
                            return '';
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: false, // Hide left titles
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      minX: 0,
                      maxX: dates.length.toDouble() - 1,
                      minY: doubleList.reduce((value, element) =>
                          value < element ? value : element),
                      maxY: doubleList.reduce((value, element) =>
                              value > element ? value : element) +
                          0.1,
                      lineBarsData: [
                        LineChartBarData(
                          spots: List<FlSpot>.generate(
                            doubleList.length,
                            (index) =>
                                FlSpot(index.toDouble(), doubleList[index]),
                          ),
                          isCurved: true,
                          colors: [Colors.blue],
                          barWidth: 2,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 4,
                                color: Colors.blue,
                                strokeWidth: 1,
                                strokeColor: Colors.white,
                              );
                            },
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            colors: [
                              Colors.blue.withOpacity(0.3),
                              Colors.blue.withOpacity(0.1),
                            ],
                          ),
                        ),
                        LineChartBarData(
                          spots: List<FlSpot>.generate(
                            doubleList2.length,
                            (index) =>
                                FlSpot(index.toDouble(), doubleList2[index]),
                          ),
                          isCurved: true,
                          colors: [
                            Colors.red
                          ], // Change the color to differentiate the lines
                          barWidth: 2,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 4,
                                color: Colors
                                    .red, // Change the color to match the line
                                strokeWidth: 1,
                                strokeColor: Colors.white,
                              );
                            },
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            colors: [
                              Colors.red.withOpacity(0.3),
                              Colors.red.withOpacity(0.1),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
