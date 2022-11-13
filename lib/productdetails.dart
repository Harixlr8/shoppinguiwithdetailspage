import 'package:flutter/material.dart';
import 'package:shoppinguiwithdetailspage/itemlist.dart';

class ProductDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemid = ModalRoute.of(context)?.settings.arguments;
    final item = items.firstWhere((element) => element['id'] == itemid);
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          item['name'],
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          height: 550,
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: (Card(
              child: Stack(
                children: [
                  Container(
                    height: 350,
                    child: Image.network(
                      item['image'],
                    ),
                  ),
                  Positioned(
                    top: 375,
                    left: 20,
                    child: Text(
                      '${item['type']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 405,
                    left: 20,
                    child: Text(
                      'Price of Item-${item['price']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 430,
                    left: 20,
                    child: Text(
                      'Item Category-${item['name']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.red,
              ),
              label: 'Add to Bag'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined, color: Colors.red),
              label: 'Add to Liked'),
          BottomNavigationBarItem(
              icon: Icon(Icons.help, color: Colors.red), label: 'Need Help!'),
        ],
      ),
    );
  }
}
