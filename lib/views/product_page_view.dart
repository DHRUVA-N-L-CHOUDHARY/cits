import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var pages = ["a", "b", "c"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: pages.length,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    TabBarView(
                      children: [
                        Image.asset("lib/config/Rectangle 23.png"),
                        Image.asset("lib/config/Rectangle 23.png"),
                        Image.asset("lib/config/Rectangle 23.png")
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 40),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.favorite, color: Colors.grey),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor:
                                    Colors.white, // <-- Button color
                                foregroundColor:
                                    Colors.white, // <-- Splash color
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.share, color: Colors.grey),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor:
                                    Colors.white, // <-- Button color
                                foregroundColor:
                                    Colors.white, // <-- Splash color
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const TabPageSelector(
                selectedColor: Colors.black54,
                color: Colors.black12,
                borderStyle: BorderStyle.none,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("Eyevy"),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                            "Full Rim Round, Cat-eyed Anti Glare Frame (48mm)"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: RichText(
                          text: const TextSpan(
                            text: "₹219   ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: [
                              WidgetSpan(
                                child: Text(
                                  "₹999",
                                  style: TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Text("  78% off",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.lightGreen)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "ADD TO CART",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.lightGreen,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "BUY NOW",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
