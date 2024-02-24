import 'dart:convert';

import 'package:coinnext/core/app_colors.dart';
import 'package:coinnext/core/env.dart';
import 'package:coinnext/screens/portfolio/dashboard/controller.dart';
import 'package:coinnext/screens/portfolio/dashboard/models/portfolio.dart';
import 'package:coinnext/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<List<PortfolioModel>> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1'));

    if (response.statusCode == 200) {
      final List<dynamic> dynamicList = jsonDecode(response.body);

      final List<PortfolioModel> data =
          List.from(dynamicList.map((e) => PortfolioModel.fromJson(e)));
      print(data);
      return data;
    } else {
      print(response.headers);
      print('Error');
      throw Exception('Failed to load Fetch');
    }
  }

  late Future<List<PortfolioModel>> futureAlbum;
  final myPortfolioController = Get.put(MyPortfolioController());

  @override
  void initState() {
    futureAlbum = fetchAlbum();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        drawerEnableOpenDragGesture: false,
        drawer: const Drawer(
          elevation: 2,
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
              child: Column(children: [
            Text('Hello'),
          ])),
        ),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.white,
          // leading: GestureDetector(
          //   onTap: () => Scaffold.of(context).openDrawer(),
          //   child: Icon(
          //     Icons.menu,
          //     size: 32,
          //     color: AppColors.grey1,
          //   ),
          // ),
          title: Row(children: [
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: AppColors.blue,
                              width: 1,
                              style: BorderStyle.none),
                          color: AppColors.blue.withOpacity(0.4)),
                      child: TextWidget(
                        text: 'Get SDG 14',
                        color: AppColors.blue,
                        size: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => Get.showSnackbar(GetSnackBar(
                        duration: const Duration(seconds: 2),
                        title: 'Hello world',
                        messageText: TextWidget(
                            text: 'I need you to work', color: AppColors.grey1),
                      )),
                      child: Container(
                        child: Icon(
                          Icons.notifications_outlined,
                          color: AppColors.grey1,
                          size: 32,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
          leadingWidth: 60,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height / 4,
                padding: const EdgeInsets.symmetric(vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'Your Balance',
                              color: AppColors.grey1,
                            ),
                            TextWidget(
                              text: 'USD 300.00',
                              color: AppColors.black,
                              size: 28,
                            ),
                          ],
                        ),
                        Container()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CircleIcon('Buy', Icons.add),
                        _CircleIcon('Sell', Icons.remove),
                        _CircleIcon('Send', Icons.arrow_upward),
                        _CircleIcon('Recieve', Icons.arrow_downward),
                        _CircleIcon('Convert', Icons.autorenew_rounded),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height / 6,
                padding: const EdgeInsets.symmetric(vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.grey1,
                                        width: 2,
                                        style: BorderStyle.solid))),
                          ),
                          const Icon(
                            Icons.clear_sharp,
                            size: 26,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      TextWidget(
                        text: 'Earn up to 5.00% APR',
                        color: AppColors.black,
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                          text: 'Learn how to earn on Yankee',
                          color: AppColors.grey1),
                    ]),
              ),
              Divider(
                height: 2,
                color: AppColors.grey2,
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextWidget(
                  text: 'WatchList',
                  color: AppColors.black,
                  size: 24,
                ),
              ),
              FutureBuilder<List<PortfolioModel>>(
                future: futureAlbum,
                initialData: myPortfolioController.portfolioList.length >= 2
                    ? myPortfolioController.portfolioList
                        as List<PortfolioModel>
                    : null,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    // myPortfolioController.add(snapshot.data!);
                    return _PortFolioTile(context, snapshot.data!);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ));
  }

  Widget _PortFolioTile(context, List<PortfolioModel> data) {
    return Column(
        children: List.generate(data.length, (index) {
      final coinData = data[index].toJson();
      return ListTile(
        leading:
            CircleAvatar(radius: 18, child: Image.network(coinData['image'])),
        title: TextWidget(
          // Try here
          text: coinData['name'],
          color: AppColors.black,
          size: 16,
        ),
        subtitle: TextWidget(
          text: coinData['symbol'],
          color: AppColors.grey1,
          size: 14,
        ),
        trailing: SizedBox(
            width: 120,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                //
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextWidget(
                      text: double.parse(coinData['current_price'])
                          .toStringAsFixed(2),
                      color: AppColors.black,
                      size: 10,
                    ),
                    TextWidget(
                      text:
                          '${double.parse(coinData['price_change_percentage_24h'].toString()).toStringAsFixed(2)}%',
                      color: double.parse(
                                  coinData['price_change_percentage_24h']
                                      .toString()) >=
                              0
                          ? AppColors.success
                          : AppColors.error,
                      size: 10,
                    ),
                  ],
                )
              ],
            )),
      );
    }));
  }

  Widget _CircleIcon(String text, IconData icon) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.black,
            child: Center(
              child: Icon(
                icon,
                color: AppColors.white,
                size: 24,
              ),
            ),
          ),
          TextWidget(text: text, color: AppColors.grey1)
        ],
      ),
    );
  }
}
