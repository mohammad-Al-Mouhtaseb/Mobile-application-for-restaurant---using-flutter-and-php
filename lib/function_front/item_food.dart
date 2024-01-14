import 'package:flutter/material.dart';
import '../view/constance.dart';

class ItemFood extends StatelessWidget {
  late int _index;
  late List _url;
  late List _name;
  late List _price;
  ItemFood(int index, List url, List name, List price) {
    _index = index;
    _url = url;
    _name = name;
    _price = price;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: kitemContainer,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: '\$',
                            style: TextStyle(color: ktext, fontSize: 15),
                            children: <TextSpan>[
                              TextSpan(
                                  text: _price[_index],
                                  style: TextStyle(
                                      color: ktext,
                                      fontWeight: FontWeight.w600)),
                            ]),
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: ktext,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                //  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),

                child: SizedBox(
                  height: size.height * 0.2,
                  child: Image.network(
                    _url[_index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      _name[_index++],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15.5,
                        color: ktext,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
