import 'dart:convert';

import 'package:coinnext/core/app_colors.dart';
import 'package:coinnext/screens/portfolio/dashboard/controller.dart';
import 'package:coinnext/screens/portfolio/dashboard/models/portfolio.dart';
import 'package:coinnext/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Future<List<PortfolioModel>> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1'));

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: TextWidget(
            text: 'Market',
            color: AppColors.black,
            size: 24,
          ),
        ),
        Container(
          height: Get.height - 156,
          width: Get.width,
          color: AppColors.white,
          child: SingleChildScrollView(
            child: FutureBuilder<List<PortfolioModel>>(
              future: futureAlbum,
              initialData: myPortfolioController.portfolioList.length >= 2
                  ? myPortfolioController.portfolioList as List<PortfolioModel>
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
            ),
          ),
        ),
      ],
    );
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
}
