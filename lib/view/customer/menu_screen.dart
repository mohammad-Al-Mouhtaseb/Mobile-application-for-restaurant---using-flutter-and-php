import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../function_front/card_menu.dart';
import '../../function_front/menu_appbar.dart';
import '../../function_front/rest_menu_info.dart';
import '../constance.dart';

import 'details_screen.dart';

import 'package:haven/main.dart';

List<String>? dishesMapUrl;
List<String>? dishesMapName;
List<String>? dishesMapprice;

class FullMenu extends StatefulWidget {
  const FullMenu({Key? key}) : super(key: key);
  static String id = "FullMenu";
  @override
  State<FullMenu> createState() => _FullMenuState();
}

class _FullMenuState extends State<FullMenu> {
  void initState() {
    super.initState();
    get_dishes();
  }

  Future get_dishes() async {
    var url = "http://$ip/PROJECT/fun/getAllMeal.php";
    dishesMapUrl = [];
    dishesMapName = [];
    dishesMapprice = [];
    var res = await http.get(Uri.parse(url));
    print(res.statusCode);
    if (res.statusCode == 200) {
      get_dishes_data(res.body);
    }
  }

  void get_dishes_data(String jsonString) {
    var data = jsonDecode(jsonString);
    var meals = data['meals'] as List<dynamic>;
    for (final meal in meals) {
      setState(() {
        dishesMapName?.add(meal['strMeal']);
        dishesMapUrl?.add(meal['strMealThumb']);

        // Check if the 'price' field exists and is not null
        if (meal.containsKey('price') && meal['price'] != null) {
          dishesMapprice?.add(meal['price']);
        } else {
          // Handle the case when 'price' is missing or not in the expected format
          dishesMapprice?.add('0');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: CustomScrollView(
        slivers: [
          MenuAppBar(),
          SliverToBoxAdapter(
            child: RestaurantInfo(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          url: dishesMapUrl![index],
                          name: dishesMapName![index],
                          price: dishesMapprice![index],
                        ),
                      ),
                    );
                  },
                  child: ItemCard(
                    index,
                    dishesMapUrl!,
                    dishesMapName!,
                    dishesMapprice!,
                  ),
                );
              },
              childCount: dishesMapUrl?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
