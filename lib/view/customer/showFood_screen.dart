import 'package:flutter/material.dart';

import '../../function_front/nav_buttom_bar.dart';
import '../constance.dart';
import '../../function_front/item_food.dart';

import 'dart:convert';
import 'package:haven/main.dart';
import 'package:http/http.dart' as http;

List<String>? dishesMapUrl;
List<String>? dishesMapName;

class Menu extends StatefulWidget {
  const Menu({super.key});
  static String id = "Menu";

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
    get_dishes();
  }

  Future get_dishes() async {
    var url = "http://$ip/PROJECT/fun/getAllMeal.php";
    dishesMapUrl = [];
    dishesMapName = [];
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          title: const Text(
            'menu',
            style: TextStyle(fontFamily: "Pacifico"),
          ),
          backgroundColor: const Color.fromARGB(149, 159, 190, 223),
          centerTitle: true,
        ),
        backgroundColor: kMainColor,
        body: GridView.builder(
            shrinkWrap: true,
            itemCount: dishesMapUrl?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.75),
            itemBuilder: (context, index) {
              return ItemFood(index, dishesMapUrl!, dishesMapName!);
            }),
        bottomNavigationBar: const nav_buttom_bar(selectedIndex: 1),
      ),
    );
  }
}
