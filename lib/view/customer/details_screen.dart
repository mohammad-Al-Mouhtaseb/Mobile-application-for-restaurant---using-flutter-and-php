import 'package:flutter/material.dart';
import '../../function_front/Details.dart';
import '../constance.dart';

class DetailsScreen extends StatefulWidget {
  final String url;
  final String name;
  final String price;

  DetailsScreen({
    required this.url,
    required this.name,
    required this.price,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> urls = [widget.url];
    List<String> names = [widget.name];
    List<String> prices = [widget.price];

    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainColor,
        body: DetailsWedgit(
          urls: urls,
          names: names,
          prices: prices,
        ),
      ),
    );
  }
}
