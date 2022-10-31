import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import 'models/overview.dart';
import 'models/performance.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String appBarTitle = 'Bottom Street';
  Data? data;
  Performance? performance;
  Dio dio = Dio();
  List dataName = [];
  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    await dio
        .get(
            'https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en')
        .then((value) => data = Data.fromJson(value.data));
    await dio
        .get(
            'https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en')
        .then((value) =>
            performance = Performance.fromJson({"element": value.data}));

    setState(() {
      dataName = [
        {'name': 'ID', 'value': data?.iD},
        {'name': 'Security', 'value': data?.security},
        {'name': 'Industry ID', 'value': data?.industryID},
        {'name': 'Industry', 'value': data?.industry},
        {'name': 'Sector ID', 'value': data?.sectorID},
        {'name': 'Sector', 'value': data?.sector},
        {'name': 'Market Cap', 'value': data?.mCAP},
        {'name': 'Enterprise Value(EV)', 'value': data?.eV},
        {'name': 'EV Date End', 'value': data?.eVDateEnd},
        {'name': 'Book Value / Share', 'value': data?.bookNavPerShare},
        {'name': 'TTMPE', 'value': data?.tTMPE},
        {'name': 'TTMPE Year End', 'value': data?.tTMYearEnd},
        {'name': 'Yield', 'value': data?.ield},
        {'name': 'Year End', 'value': data?.yearEnd},
        {'name': 'Sector Slug', 'value': data?.sectorSlug},
        {'name': 'Industry Slug', 'value': data?.industrySlug},
        {'name': 'Security Slug', 'value': data?.securitySlug},
        {'name': 'PEG Ratio', 'value': data?.pEGRatio}
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                20.heightBox,
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dataName.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              dataName[index]['name']
                                  .toString()
                                  .text
                                  .blue600
                                  .make(),
                              dataName[index]['value']
                                  .toString()
                                  .text
                                  .black
                                  .make()
                            ],
                          ),
                          15.heightBox
                        ],
                      );
                    }),
                20.heightBox,
                'Performance'.text.xl2.bold.make(),
                20.heightBox,
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: performance?.element?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 20,
                                  child: '${performance?.element?[index].label}'
                                      .text
                                      .make()),
                              10.widthBox,
                              Expanded(
                                  flex: 60,
                                  child: LinearProgressIndicator(
                                    color: (performance?.element?[index]
                                                    .changePercent ??
                                                0) <
                                            0
                                        ? Vx.red600
                                        : Vx.green600,
                                    minHeight: 20,
                                    backgroundColor: Vx.gray200,
                                    value: (performance
                                                ?.element?[index].changePercent
                                                ?.abs() ??
                                            0 / 100) /
                                        100,
                                  )),
                              10.widthBox,
                              Expanded(
                                  flex: 20,
                                  child: (performance?.element?[index]
                                                  .changePercent ??
                                              0) <
                                          0
                                      ? Row(
                                          children: [
                                            const Icon(Icons.arrow_drop_down,
                                                color: Vx.red600),
                                            '${performance?.element?[index].changePercent}0'
                                                .substring(0, 5)
                                                .text
                                                .red600
                                                .make(),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            const Icon(
                                              Icons.arrow_drop_up,
                                              color: Vx.green600,
                                            ),
                                            '${performance?.element?[index].changePercent}0'
                                                .substring(0, 5)
                                                .text
                                                .green600
                                                .make(),
                                          ],
                                        )),
                            ],
                          ),
                          15.heightBox
                        ],
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
