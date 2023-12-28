import 'package:flutter/material.dart';

import '../../function_front/nav_buttom_bar.dart';
import '../constance.dart';
import '../../function_front/item_favorites.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  static String id = "FavoriteScreen";

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 1.1;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 4,
            title: const Text(
              'favorites',
              style: TextStyle(fontFamily: "Pacifico"),
            ),
            backgroundColor: const Color.fromARGB(149, 159, 190, 223),
            centerTitle: true,
          ),
          backgroundColor: kMainColor,
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ItemFavorite(size: size);
            },
          ),
          bottomNavigationBar: nav_buttom_bar(selectedIndex: 3)),
    );
  }
}
