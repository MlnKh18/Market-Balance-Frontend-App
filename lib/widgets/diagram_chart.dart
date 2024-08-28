import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  late List<_SalesData> chartData;
  late String selectedDataType;

  @override
  void initState() {
    super.initState();
    selectedDataType = 'Gula';
    chartData = _getChartData(selectedDataType);
  }

  void _onDataTypeSelected(String result) {
    setState(() {
      selectedDataType = result;
      chartData = _getChartData(selectedDataType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Grafik Harga",
              style: fontPoppins.copyWith(
                fontSize: 15,
                color: primaryColor,
                fontWeight: fWBold,
              ),
            ),
            const Gap(10),
            Container(
              width: 120,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: fiveColor,
              ),
              child: PopupMenuButton<String>(
                tooltip: "Pilih barang",
                onSelected: _onDataTypeSelected,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Gula',
                    child: Text('Gula'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Beras',
                    child: Text('Beras'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Minyak Goreng',
                    child: Text('Minyak Goreng'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Sembako',
                    child: Text('Sembako'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Egg',
                    child: Text('Egg'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Fish',
                    child: Text('Fish'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Meat',
                    child: Text('Meat'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Rice',
                    child: Text('Rice'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Plant',
                    child: Text('Plant'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Chilli',
                    child: Text('Chilli'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Sugar',
                    child: Text('Sugar'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Potato',
                    child: Text('Potato'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Milk',
                    child: Text('Milk'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Fruit',
                    child: Text('Fruit'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Corn',
                    child: Text('Corn'),
                  ),
                ],
                child: Center(
                  child: Text(
                    selectedDataType,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Gap(20),
        SizedBox(
          height: 300,
          child: SfCartesianChart(
            primaryXAxis: const CategoryAxis(),
            legend: const Legend(isVisible: false),
            tooltipBehavior:
                TooltipBehavior(enable: true, header: "Harga Sembako"),
            series: <CartesianSeries<_SalesData, String>>[
              LineSeries<_SalesData, String>(
                enableTooltip: true,
                dataSource: chartData,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) =>
                    double.parse(sales.value.replaceAll(".", "")),
                width: 2,
                color: secondaryColor,
                markerSettings: const MarkerSettings(
                  isVisible: true,
                  height: 4,
                  width: 4,
                  shape: DataMarkerType.circle,
                  borderWidth: 3,
                  borderColor: primaryColor,
                ),
                dataLabelSettings: const DataLabelSettings(
                  isVisible: false,
                  labelAlignment: ChartDataLabelAlignment.auto,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SalesData {
  final String year;
  final String value;
  final String type;

  _SalesData(this.year, this.value, this.type);
}

List<_SalesData> _getChartData(String dataType) {
  switch (dataType) {
    case 'Gula':
      return [
        _SalesData('2018', "2.000", "Gula"),
        _SalesData('2019', "20.000", "Gula"),
        _SalesData('2020', "6.000", "Gula"),
        _SalesData('2021', "8.000", "Gula"),
        _SalesData('2022', "10.000", "Gula"),
        _SalesData('2023', "150.000", "Gula"),
      ];
    case 'Beras':
      return [
        _SalesData('2018', "1.500", "Beras"),
        _SalesData('2019', "18.000", "Beras"),
        _SalesData('2020', "14.650", "Beras"),
        _SalesData('2021', "7.500", "Beras"),
        _SalesData('2022', "9.000", "Beras"),
        _SalesData('2023', "10.000", "Beras"),
      ];
    case 'Minyak Goreng':
      return [
        _SalesData('2018', "3.000", "Minyak Goreng"),
        _SalesData('2019', "22.000", "Minyak Goreng"),
        _SalesData('2020', "7.000", "Minyak Goreng"),
        _SalesData('2021', "9.000", "Minyak Goreng"),
        _SalesData('2022', "11.000", "Minyak Goreng"),
        _SalesData('2023', "120.000", "Minyak Goreng"),
      ];
    case 'Sembako':
      return [
        _SalesData('2018', "8.000", "Sembako"),
        _SalesData('2019', "25.000", "Sembako"),
        _SalesData('2020', "70.000", "Sembako"),
        _SalesData('2021', "15.000", "Sembako"),
        _SalesData('2022', "50.000", "Sembako"),
        _SalesData('2023', "200.000", "Sembako"),
      ];
    case 'Egg':
      return [
        _SalesData('2018', "2.000", "Egg"),
        _SalesData('2019', "2.500", "Egg"),
        _SalesData('2020', "2.500", "Egg"),
        _SalesData('2021', "3.000", "Egg"),
        _SalesData('2022', "10.000", "Egg"),
        _SalesData('2023', "15.000", "Egg"),
      ];
    case 'Fish':
      return [
        _SalesData('2018', "4.000", "Fish"),
        _SalesData('2019', "12.000", "Fish"),
        _SalesData('2020', "9.000", "Fish"),
        _SalesData('2021', "10.000", "Fish"),
        _SalesData('2022', "45.000", "Fish"),
        _SalesData('2023', "160.000", "Fish"),
      ];
    case 'Meat':
      return [
        _SalesData('2018', "7.000", "Meat"),
        _SalesData('2019', "30.000", "Meat"),
        _SalesData('2020', "15.000", "Meat"),
        _SalesData('2021', "20.000", "Meat"),
        _SalesData('2022', "25.000", "Meat"),
        _SalesData('2023', "300.000", "Meat"),
      ];
    case 'Rice':
      return [
        _SalesData('2018', "3.000", "Rice"),
        _SalesData('2019', "25.000", "Rice"),
        _SalesData('2020', "10.000", "Rice"),
        _SalesData('2021', "15.000", "Rice"),
        _SalesData('2022', "18.000", "Rice"),
        _SalesData('2023', "250.000", "Rice"),
      ];
    case 'Plant':
      return [
        _SalesData('2018', "2.000", "Plant"),
        _SalesData('2019', "10.000", "Plant"),
        _SalesData('2020', "5.000", "Plant"),
        _SalesData('2021', "7.000", "Plant"),
        _SalesData('2022', "9.000", "Plant"),
        _SalesData('2023', "100.000", "Plant"),
      ];
    case 'Chilli':
      return [
        _SalesData('2018', "1.000", "Chilli"),
        _SalesData('2019', "10.000", "Chilli"),
        _SalesData('2020', "3.000", "Chilli"),
        _SalesData('2021', "50.000", "Chilli"),
        _SalesData('2022', "7.000", "Chilli"),
        _SalesData('2023', "80.000", "Chilli"),
      ];
    case 'Sugar':
      return [
        _SalesData('2018', "4.000", "Sugar"),
        _SalesData('2019', "18.000", "Sugar"),
        _SalesData('2020', "7.000", "Sugar"),
        _SalesData('2021', "9.000", "Sugar"),
        _SalesData('2022', "11.000", "Sugar"),
        _SalesData('2023', "150.000", "Sugar"),
      ];
    case 'Potato':
      return [
        _SalesData('2018', "1.500", "Potato"),
        _SalesData('2019', "12.000", "Potato"),
        _SalesData('2020', "5.000", "Potato"),
        _SalesData('2021', "7.500", "Potato"),
        _SalesData('2022', "9.000", "Potato"),
        _SalesData('2023', "100.000", "Potato"),
      ];
    case 'Milk':
      return [
        _SalesData('2018', "2.000", "Milk"),
        _SalesData('2019', "15.000", "Milk"),
        _SalesData('2020', "6.000", "Milk"),
        _SalesData('2021', "8.000", "Milk"),
        _SalesData('2022', "10.000", "Milk"),
        _SalesData('2023', "120.000", "Milk"),
      ];
    case 'Fruit':
      return [
        _SalesData('2018', "3.000", "Fruit"),
        _SalesData('2019', "20.000", "Fruit"),
        _SalesData('2020', "6.000", "Fruit"),
        _SalesData('2021', "8.000", "Fruit"),
        _SalesData('2022', "10.000", "Fruit"),
        _SalesData('2023', "150.000", "Fruit"),
      ];
    case 'Corn':
      return [
        _SalesData('2018', "2.000", "Corn"),
        _SalesData('2019', "15.000", "Corn"),
        _SalesData('2020', "6.000", "Corn"),
        _SalesData('2021', "8.000", "Corn"),
        _SalesData('2022', "10.000", "Corn"),
        _SalesData('2023', "120.000", "Corn"),
      ];
    default:
      return [];
  }
}
