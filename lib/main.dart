import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppinguiwithdetailspage/itemlist.dart';
import 'package:shoppinguiwithdetailspage/productdetails.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingPage(),
      routes: {
        'product-description': (context) => ProductDescription(),
      },
    ),
  );
}

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Mens Shirts'),
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Icon(Icons.menu),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            children: items.map(
              (itemlist) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        'product-description',
                        arguments: itemlist['id'],
                      );
                    },
                    child: Container(
                      height: 350,
                      child: Stack(
                        children: [
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(itemlist['image']),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 255,
                            left: 55,
                            child: Text(
                              itemlist['name'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 255,
                            right: 55,
                            child: Text(
                              itemlist['price'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ).toList()),
      ),
    );
  }
}
