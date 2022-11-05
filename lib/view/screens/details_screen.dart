import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/themes.dart';
import '../../view_model/provider/details_provider.dart';

class DetailScreen extends StatelessWidget {
  String s = "\$";


  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context, provider, child) {
      // provider.detailsModel.id = Id;
      var data = [
        ChartData(
            "1y", provider.detailsModel?.percentChange_1y ?? 0),
        ChartData(
            "200d", provider.detailsModel?.percentChange_200.toDouble() ?? 0),
        ChartData(
            "60d", provider.detailsModel?.percentChange_60.toDouble() ?? 0),
        ChartData(
            "30d", provider.detailsModel?.percentChange_30.toDouble() ?? 0),
        ChartData(
            "14d", provider.detailsModel?.percentChange_14.toDouble() ?? 0),
        ChartData(
            "7d", provider.detailsModel?.percentChange_7d.toDouble() ?? 0),
        ChartData(
            "24h", provider.detailsModel?.percentChange_24h.toDouble() ?? 0),

      ];
      return Scaffold(
          body: provider.detailsModel!.id == null
              ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
          )
              : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .0385,),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .25,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Image.network(
                          provider.detailsModel!.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){
                      Get.back();
                    },
                        iconSize: 40,
                        icon:Icon(Icons.chevron_left))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        provider.detailsModel!.name,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Rank",
                          style: TextStyle(
                              fontSize: 25),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(66, 66, 66, 1),
                          ),
                          child: Center(
                              child: Text(
                                provider.detailsModel!.market_cap_rank
                                    .toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color:Colors.white  ,),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    provider.detailsModel!.symbol,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "${provider.detailsModel!.currentPrice}$s",
                        style:
                        TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${provider.detailsModel!.percentChange_24h}%",
                      style: TextStyle(
                          color:
                          provider.detailsModel!.percentChange_24h >= 0
                              ? Colors.green
                              : Colors.red,
                          fontSize: 20),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(

                    height: 200,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),


                    ),
                    child: Card(
                      color: Themes.isDarkMode(context) ? Color(0xff151f2c) : Colors.blueGrey,
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          isVisible: true,
                          majorGridLines: MajorGridLines(width: 1),
                          axisLine: AxisLine(width: 3),
                          labelStyle: TextStyle(
                              color: Themes.isDarkMode(context) ?  Colors.white :Color(0xff151f2c) , fontSize: 20),
                          majorTickLines: MajorTickLines(size: 0),
                        ),
                        primaryYAxis: CategoryAxis(isVisible: false),
                        series: <ChartSeries<ChartData, String>>[
                          LineSeries(dataSource: data,
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true),
                              width: 3,
                              color: Colors.green,
                              xValueMapper: (ChartData sales, _) =>
                                  sales.x.toString(),
                              yValueMapper: (ChartData sales, _) => sales.y
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Description",
                    style: TextStyle(

                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Html(
                      data: "${provider.detailsModel!.description}",

                    )
                ),
              ],
            ),
          ));
    });
  }
}

class ChartData {
  ChartData(this.x, this.y);

  String x;
  double y;
}
