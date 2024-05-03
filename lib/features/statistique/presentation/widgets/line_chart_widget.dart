import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/core/utils/global_function_utils.dart';
import 'package:orange_grs/features/sites/domain/entities/facture_site.dart';

class LineChartWidget extends StatelessWidget {
  final List<FactureSite>? listFactures;
  const LineChartWidget({super.key, this.listFactures});

  @override
  Widget build(BuildContext context) {

    double maxFinalSolde = listFactures != null && listFactures!.isNotEmpty ? listFactures!.map((facture) => facture.finalSolde).reduce((maxValue, value) => value > maxValue ? value : maxValue) : 0;
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups(listFactures),
        gridData: const FlGridData(show: true),
        alignment: BarChartAlignment.spaceAround,
        maxY: GlobalFunctionUtils.convertEnTnd(maxFinalSolde) + 250
      )
    );
  }



  BarTouchData get barTouchData => BarTouchData(
  enabled: false,
  touchTooltipData: BarTouchTooltipData(
    tooltipPadding: const EdgeInsets.all(2),
    tooltipMargin: 8,
    getTooltipItem: (group, groupIndex, rod, rodIndex) {
      return BarTooltipItem(
        rod.toY.toString(),
        const TextStyle(color: whiteColor, fontWeight: FontWeight.bold)
      );
    },
  )
);


Widget getTitles(double value, TitleMeta meta){
  const style = TextStyle(
    color: secondaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 14
  );

  String text;
  if(listFactures != null && listFactures!.isNotEmpty){
    switch(value.toInt()){
      case 0:
        int month = listFactures != null ? listFactures![0].month : 0;
        int year = listFactures != null ? listFactures![0].year : 0;
        text = '0$month/$year'; break;
      case 1:
        int month = listFactures != null ? listFactures![1].month : 0;
        int year = listFactures != null ? listFactures![1].year : 0;
        text = '0$month/$year'; break;
      case 2:
        int month = listFactures != null ? listFactures![2].month : 0;
        int year = listFactures != null ? listFactures![2].year : 0;
        text = '0$month/$year'; break;
      case 3:
        int month = listFactures != null ? listFactures![3].month : 0;
        int year = listFactures != null ? listFactures![3].year : 0;
        text = '0$month/$year'; break;
      case 4:
        int month = listFactures != null ? listFactures![4].month : 0;
        int year = listFactures != null ? listFactures![4].year : 0;
        text = '0$month/$year'; break;
      case 5:
        int month = listFactures != null ? listFactures![5].month : 0;
        int year = listFactures != null ? listFactures![5].year : 0;
        text = '0$month/$year'; break;
      default:
        text = '_'; break;
    }
  }else{
    text = "00-0000";
  }
  

  return SideTitleWidget(
    axisSide: meta.axisSide, 
    space: 5,
    angle: 5.5,
    child: Text(text, style: style,), 
    );
}



FlTitlesData get titlesData => FlTitlesData(
  show: true,
  bottomTitles: AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 30,
      getTitlesWidget: getTitles
    )
  ),
  leftTitles: const AxisTitles(
    sideTitles: SideTitles(showTitles: false)
  ),
  topTitles: const AxisTitles(
    sideTitles: SideTitles(showTitles: false)
  ),
  rightTitles: const AxisTitles(
    sideTitles: SideTitles(showTitles: false)
  ),
);


FlBorderData get borderData => FlBorderData(
  show: false
);


LinearGradient get _barsGradient => const LinearGradient(colors: [
      primaryColor,
      primaryColor
    ],

    begin: Alignment.bottomCenter,
    end: Alignment.topCenter
);


List<BarChartGroupData> barGroups(List<FactureSite>? factures) => [
  BarChartGroupData(
    x: 0, 
    barRods: [
      BarChartRodData(toY: factures != null ? GlobalFunctionUtils.convertEnTnd(factures[0].finalSolde) : 0, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),


    BarChartGroupData(
    x: 1, 
    barRods: [
      BarChartRodData(toY: factures != null ? GlobalFunctionUtils.convertEnTnd(factures[1].finalSolde) : 0, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),


    BarChartGroupData(
    x: 2, 
    barRods: [
      BarChartRodData(toY: factures != null ? GlobalFunctionUtils.convertEnTnd(factures[2].finalSolde) : 0, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),

    BarChartGroupData(
    x: 3, 
    barRods: [
      BarChartRodData(toY: factures != null ? GlobalFunctionUtils.convertEnTnd(factures[3].finalSolde) : 0, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),


    BarChartGroupData(
    x: 4, 
    barRods: [
      BarChartRodData(toY: factures != null ? GlobalFunctionUtils.convertEnTnd(factures[4].finalSolde) : 0, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),


    BarChartGroupData(
    x: 5, 
    barRods: [
      BarChartRodData(toY: factures != null ? GlobalFunctionUtils.convertEnTnd(factures[5].finalSolde) : 0, gradient: _barsGradient)
    ],
    showingTooltipIndicators: [0]
    ),
];
}


