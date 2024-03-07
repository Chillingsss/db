import 'package:flutter/material.dart';
import 'package:db/store.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> _shopList = [];
  String coke = "Coke";
  String noodles = "Noodles";
  String bulad = "Bulad";
  String shampoo = "Shampoo";

  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("SHOPPING CART"),
                    content: Container(
                      height: 500,
                      width: 500,
                      child: createListView(),
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 500),
            child: Text(
              "ANDREWSABEL",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 600),
            child: Text("STORE"),
          ),
          Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    'images/OIP.jpg',
                    height: 300,
                    width: 300,
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      saveRecord(
                        coke,
                        10,
                        Image.asset(
                          'images/coke.jpg',
                          height: 100,
                          width: 100,
                        ),
                      );
                    },
                    child: Image.asset(
                      'images/coke.jpg',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text("Coke"),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      saveRecord(
                        noodles,
                        30,
                        Image.asset(
                          'images/noodles.jpg',
                          height: 100,
                          width: 100,
                        ),
                      );
                    },
                    child: Image.asset(
                      'images/noodles.jpg',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text("Noodles"),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      saveRecord(
                        bulad,
                        20,
                        Image.asset(
                          'images/bulad.jpg',
                          height: 100,
                          width: 100,
                        ),
                      );
                    },
                    child: Image.asset(
                      'images/bulad.jpg',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text("Bulad"),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      saveRecord(
                        shampoo,
                        40,
                        Image.asset(
                          'images/shampoo.png',
                          height: 100,
                          width: 100,
                        ),
                      );
                    },
                    child: Image.asset(
                      'images/shampoo.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text("Shampoo"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Store(
                    listview: createListView(),
                    total: total,
                  ),
                ),
              );
            },
            child: Text("Checkout"),
          ),
        ],
      ),
    );
  }

  void saveRecord(String order, double price, Image image) {
    Map<String, dynamic> shopCart = {
      "order": order,
      "price": price,
      "image": image,
    };

    setState(() {
      _shopList.add(shopCart);
      total += price;
    });

    // computeTotalBalance();
  }

  // void computeTotalBalance() {
  //   double totalBalance = 0;
  //   _shopList.forEach(() {
  //     totalBalance += student.balance;
  //   });
  //   setState(() {
  //     total = totalBalance;
  //   });
  // }

  Widget createListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _shopList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              _shopList[index]['order'],
            ),
            subtitle: Text(_shopList[index]['price'].toString()),
            leading: _shopList[index]['image'],
          ),
        );
      },
    );
  }
}
