import 'dart:convert';

import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:haven/main.dart';
import '../constance.dart';
import '../../function_front/item_food.dart';

import 'package:http/http.dart' as http;

List<String>? SearshdishesMapUrl;
List<String>? SearshdishesMapName;
List<String>? SearshdishesMapPrice;

class searsh_screen extends StatefulWidget {
  const searsh_screen({super.key});
  static String id = "searsh_screen";

  @override
  State<searsh_screen> createState() => _searsh_screenState();
}

class _searsh_screenState extends State<searsh_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_searsh();
  }

  Future get_searsh() async {
    String search = textEditingController_searsh.text;
    var url = "http://$ip/PROJECT/fun/searshMeal.php?s=$search";
    SearshdishesMapUrl = [];
    SearshdishesMapName = [];
    SearshdishesMapPrice = [];
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
        SearshdishesMapName?.add(meal['strMeal']);
        SearshdishesMapUrl?.add(meal['strMealThumb']);
        SearshdishesMapPrice?.add(meal['price']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          backgroundColor: const Color.fromARGB(149, 159, 190, 223),
          centerTitle: true,
        ),
        backgroundColor: kMainColor,
        body: GridView.builder(
            shrinkWrap: true,
            itemCount: SearshdishesMapUrl?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.75),
            itemBuilder: (context, index) {
              return ItemFood(index, SearshdishesMapUrl!, SearshdishesMapName!,
                  SearshdishesMapPrice!);
            }),
      ),
    );
  }
}
