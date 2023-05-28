// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'data_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartWidget extends StatefulWidget {
  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  List<DataModel> _list = List<DataModel>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _list.add(DataModel(key: "0", value: "2"));
    _list.add(DataModel(key: "1", value: "4"));
    _list.add(DataModel(key: "2", value: "6"));
    _list.add(DataModel(key: "3", value: "8"));
    _list.add(DataModel(key: "4", value: "10"));
    _list.add(DataModel(key: "5", value: "8"));
    _list.add(DataModel(key: "6", value: "6"));
    _list.add(DataModel(key: "7", value: "3"));
    _list.add(DataModel(key: "8", value: "1"));
    _list.add(DataModel(key: "9", value: "4"));
    _list.add(DataModel(key: "10", value: "8"));
    _list.add(DataModel(key: "11", value: "3"));
    _list.add(DataModel(key: "12", value: "8"));
    _list.add(DataModel(key: "13", value: "1"));
    _list.add(DataModel(key: "14", value: "9"));
    _list.add(DataModel(key: "15", value: "3"));
    _list.add(DataModel(key: "16", value: "8"));
    _list.add(DataModel(key: "17", value: "1"));
    _list.add(DataModel(key: "18", value: "4"));
    _list.add(DataModel(key: "19", value: "2"));
    _list.add(DataModel(key: "20", value: "5"));
    _list.add(DataModel(key: "21", value: "1"));
    _list.add(DataModel(key: "22", value: "0.5"));
    _list.add(DataModel(key: "23", value: "2"));
    _list.add(DataModel(key: "24", value: "4"));
    _list.add(DataModel(key: "25", value: "5"));
    _list.add(DataModel(key: "26", value: "6"));
    _list.add(DataModel(key: "27", value: "10"));
    _list.add(DataModel(key: "28", value: "1"));
    _list.add(DataModel(key: "29", value: "8"));
    _list.add(DataModel(key: "30", value: "3"));
    _list.add(DataModel(key: "31", value: "7"));
    _list.add(DataModel(key: "32", value: "2"));
    _list.add(DataModel(key: "33", value: "9"));
    _list.add(DataModel(key: "34", value: "1"));
    _list.add(DataModel(key: "35", value: "7"));
    _list.add(DataModel(key: "36", value: "4"));
    _list.add(DataModel(key: "37", value: "2"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            height: 50,
            width: 200,
          ),
          Container(
            color: Colors.white,
            height: 300,
            width: 200,
            child: BarChart(
              BarChartData(
                backgroundColor: Colors.white,
                barGroups: _chartGroups(),
                borderData: FlBorderData(
                  border: const Border(bottom: BorderSide(), left: BorderSide()),
                ),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text(
                      'Division',
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                          ),
                      ))),
                    TableCell(child: Center(child: Text(
                      'Number Tested',
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                          ),
                      ))),
                  ],
                ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Makindye'))),
                      TableCell(child: Center(child: Text('10'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Kampala'))),
                      TableCell(child: Center(child: Text('23'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Nakawa'))),
                      TableCell(child: Center(child: Text('45'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Kawempe'))),
                      TableCell(child: Center(child: Text('13'))),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    List<BarChartGroupData> list = List<BarChartGroupData>.empty(growable: true);

    int numberOfGroups = _list.length ~/ 3;
    List<Color> colors = [Colors.blue, Colors.red, Colors.green];

    for (int i = 0; i < numberOfGroups; i++) {
      List<BarChartRodData> bars = List<BarChartRodData>.empty(growable: true);

      int numberOfBars = 3;

      for (int j = 0; j < numberOfBars; j++) {
        int index = i * numberOfBars + j;
        bars.add(
          BarChartRodData(
            toY: double.parse(_list[index].value!),
            color: colors[j % colors.length],
          ),
        );
      }

      list.add(
        BarChartGroupData(
          x: i,
          barRods: bars,
          barsSpace: 0,
        ),
      );
    }

    return list;
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Jan';
              break;
            case 1:
              text = 'Feb';
              break;
            case 2:
              text = 'Mar';
              break;
            case 3:
              text = 'Apr';
              break;
            case 4:
              text = 'May';
              break;
            case 5:
              text = 'Jun';
              break;
            case 6:
              text = 'Jul';
              break;
            case 7:
              text = 'Aug';
              break;
            case 8:
              text = 'Sep';
              break;
            case 9:
              text = 'Oct';
              break;
            case 10:
              text = 'Nov';
              break;
            case 11:
              text = 'Dec';
              break;
          }

          return Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          );
        },
      );
}






























































// // ignore_for_file: prefer_const_constructors

// import 'data_model.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class BarChartWidget extends StatefulWidget {
//   @override
//   State<BarChartWidget> createState() => _BarChartWidgetState();
// }

// class _BarChartWidgetState extends State<BarChartWidget> {
//   List<DataModel> _list = List<DataModel>.empty(growable: true);

//   @override
//   void initState() {
//     super.initState();
//     _list.add(DataModel(key: "0", value: "2"));
//     _list.add(DataModel(key: "1", value: "4"));
//     _list.add(DataModel(key: "2", value: "6"));
//     _list.add(DataModel(key: "3", value: "8"));
//     _list.add(DataModel(key: "4", value: "10"));
//     _list.add(DataModel(key: "5", value: "8"));
//     _list.add(DataModel(key: "6", value: "6"));
//     _list.add(DataModel(key: "7", value: "3"));
//     _list.add(DataModel(key: "8", value: "1"));
//     _list.add(DataModel(key: "9", value: "4"));
//     _list.add(DataModel(key: "10", value: "8"));
//     _list.add(DataModel(key: "11", value: "3"));
//     _list.add(DataModel(key: "12", value: "8"));
//     _list.add(DataModel(key: "13", value: "1"));
//     _list.add(DataModel(key: "14", value: "9"));
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           color: Colors.black,
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       backgroundColor: const Color(0xFFF5F5F3),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 10), 
//             color: Colors.white,
//             height: 50,
//             width: 200,
//           ),
//           Container(
//             color: Colors.white,
//             height: 300,
//             width: 200,
//             child: BarChart(
//               BarChartData(
//                 backgroundColor: Colors.white,
//                 barGroups: _chartGroups(),
//                 borderData: FlBorderData(
//                     border: const Border(bottom: BorderSide(), left: BorderSide())),
//                 gridData: FlGridData(show: false),
//                 titlesData: FlTitlesData(
//                   bottomTitles: AxisTitles(sideTitles: _bottomTitles),
//                   leftTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       interval: 1,
//                       getTitlesWidget: (value, meta) {
//                         return Text(
//                           value.toString(),
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 13
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                   rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// List<BarChartGroupData> _chartGroups() {
//   List<BarChartGroupData> list = List<BarChartGroupData>.empty(growable: true);

//   int numberOfGroups = _list.length ~/ 2; 
//   List<Color> colors = [ Colors.blue, Colors.green, Colors.red, Colors.purple, Colors.amber];

//   for (int i = 0; i < numberOfGroups; i++) {
//     List<BarChartRodData> bars = List<BarChartRodData>.empty(growable: true);

 
//     int numberOfBars = 2; 

//     for (int j = 0; j < numberOfBars; j++) {
//       int index = i * numberOfBars + j;
//       bars.add(
//         BarChartRodData(
//           toY: double.parse(_list[index].value!),
//           color: colors[j % colors.length],
//         ),
//       );
//     }

//     list.add(
//       BarChartGroupData(
//         x: i,
//         barRods: bars,
//         barsSpace: 0,
//       ),
//     );
//   }

//   return list;
// }
//   SideTitles get _bottomTitles => SideTitles(
//         showTitles: true,
//         getTitlesWidget: (value, meta) {
//           String text = '';
//           switch (value.toInt()) {
//             case 0:
//               text = 'Mon';
//               break;
//             case 1:
//               text = 'Tue';
//               break;
//             case 2:
//               text = 'Wed';
//               break;
//             case 3:
//               text = 'Thu';
//               break;
//             case 4:
//               text = 'Fri';
//               break;
//             case 5:
//               text = 'Sat';
//               break;
//             case 6:
//               text = 'Sun';
//               break;
//           }

//           return Text(
//             text,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15
//             ),
//           );
//         },
//       );
// }
