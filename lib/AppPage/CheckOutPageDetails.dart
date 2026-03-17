import 'package:ecommerce_app/AppPage/ProccessCheckout.dart';
import 'package:flutter/material.dart';

import '/DataApi/DataApi.dart';

class Checkoutpagedetails extends StatelessWidget {
  final String titles;
  const Checkoutpagedetails({super.key, required this.titles});

  void _showShareSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 350,
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              Row(
                children: [
                  Text(
                    "Order Summary",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Items", style: TextStyle(fontSize: 19)),
                  Spacer(),
                  Text("3"),
                ],
              ),
              Row(
                children: [
                  Text("Subtotal", style: TextStyle(fontSize: 19)),
                  Spacer(),
                  Text("\$423"),
                ],
              ),
              Row(
                children: [
                  Text("Discount", style: TextStyle(fontSize: 19)),
                  Spacer(),
                  Text("\$4"),
                ],
              ),

              Row(
                children: [
                  Text("Delivery", style: TextStyle(fontSize: 19)),
                  Spacer(),
                  Text("\$2"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "\$423",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // Search Bar
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light background to make cards pop
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          titles,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16),
        itemCount: productfeature.length,
        itemBuilder: (context, index) {
          final products = productfeature[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                // Product Image
                Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(products['image'], fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          products['price'].toString(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_task,
                        color: Colors.blueAccent,
                        size: 20,
                      ),
                      onPressed: () => _showShareSheet(context),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      // Added a Bottom Navigation Bar for the "Checkout" Action
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Proccesscheckout(title: "Card"),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Proceed to Checkout",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
