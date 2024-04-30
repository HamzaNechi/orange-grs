import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: true),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20
      )
    );
  }
}


BarTouchData get barTouchData => BarTouchData(
  enabled: false,
  touchTooltipData: BarTouchTooltipData(
    tooltipPadding: const EdgeInsets.all(2),
    tooltipMargin: 8,
    getTooltipItem: (group, groupIndex, rod, rodIndex) {
      return BarTooltipItem(
        rod.toY.toString(),
        const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold)
      );
    },
  )
);


Widget getTitles(double value, TitleMeta meta){
  const style = TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 14
  );

  String text;
  switch(value.toInt()){
    case 0:
      text = 'Janv'; break;
    case 1:
      text = 'Fév'; break;
    case 2:
      text = 'Mrs'; break;
    case 3:
      text = 'Avr'; break;
    case 4:
      text = 'Mai'; break;
    case 5:
      text = 'Juin'; break;
    case 6:
      text = 'Juillet'; break;
    case 7:
      text = 'Aout'; break;
    case 8:
      text = 'Sept'; break;
    case 9:
      text = 'Oct'; break;
    case 10:
      text = 'Nov'; break;
    case 11:
      text = 'Déc'; break;
    default:
      text = 'Pe'; break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide, 
    space: 4,
    child: Text(text, style: style,), 
    );
}



FlTitlesData get titlesData => const FlTitlesData(
  show: true,
  bottomTitles: AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 30,
      getTitlesWidget: getTitles
    )
  ),
  leftTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false)
  ),
  topTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false)
  ),
  rightTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false)
  ),
);


FlBorderData get borderData => FlBorderData(
  show: false
);


LinearGradient get _barsGradient => const LinearGradient(colors: [
      Colors.blueAccent,
      Colors.blue
    ],

    begin: Alignment.bottomCenter,
    end: Alignment.topCenter
);


List<BarChartGroupData> get barGroups => [
  BarChartGroupData(
    x: 0, 
    barRods: [
      BarChartRodData(toY: 8, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),


    BarChartGroupData(
    x: 1, 
    barRods: [
      BarChartRodData(toY: 10, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),


    BarChartGroupData(
    x: 2, 
    barRods: [
      BarChartRodData(toY: 15, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),

    BarChartGroupData(
    x: 3, 
    barRods: [
      BarChartRodData(toY: 2, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),


    BarChartGroupData(
    x: 4, 
    barRods: [
      BarChartRodData(toY: 7, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),


    BarChartGroupData(
    x: 5, 
    barRods: [
      BarChartRodData(toY: 12, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),
];