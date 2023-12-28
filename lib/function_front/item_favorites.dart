//remove const when add api
//when add api addition image and 3 text to constructer

import 'package:flutter/material.dart';

import '../view/constance.dart';

class ItemFavorite extends StatelessWidget {
  const ItemFavorite({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            height: size.height * 0.40,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: kitemContainer),
            child: Column(
              children: [
                SizedBox(
                  // height: size.height * 0.30,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      child: Image.asset("images/foo.webp")),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 8, bottom: 3),
                  child: Row(
                    children: [
                      //add name food
                      Text(
                        "crooissants",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ktext),
                      ),
                      Spacer(),
                      //to remove frome favorite
                      InkWell(
                        //when prees this icon remove frome favorite f=0
                        onTap: () {},
                        child: const Icon(
                          Icons.delete,
                          color: ktext,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                //add to classify
                const Padding(
                  padding: const EdgeInsets.only(right: 295, bottom: 6),
                  child: Text(
                    "brakefast",
                    style: TextStyle(color: Color.fromARGB(208, 79, 7, 7)),
                  ),
                ),
                // text to add price
                const Padding(
                  padding: const EdgeInsets.only(right: 320),
                  child: Text(
                    "45 \$",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ktext),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
