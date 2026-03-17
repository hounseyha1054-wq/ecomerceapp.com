import 'package:ecommerce_app/AppPage/Order.dart';
import 'package:flutter/material.dart';

class Proccesscheckout extends StatefulWidget {
  final String title;
  const Proccesscheckout({super.key, required this.title});

  @override
  State<Proccesscheckout> createState() => _ProccesscheckoutState();
}

class _ProccesscheckoutState extends State<Proccesscheckout> {
  @override
  Widget build(BuildContext context) {
    bool? value = false;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: Text(widget.title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  "https://www.shutterstock.com/image-vector/pin-point-logo-can-be-260nw-1679653036.jpg",
                  fit: BoxFit.cover,
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "325 15th Eighth Avenue, NewYork",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Saepe eaque fugiat ea voluptatum veniam.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  "https://previews.123rf.com/images/andyadi/andyadi2002/andyadi200200114/141050517-hours-time-duration-clock-vector-logo-design-concept-template.jpg",
                  fit: BoxFit.cover,
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "6:00 pm, Wednesday 20",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Text(
                      "Order Summary",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
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
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$423",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Choose payment method",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  child: Row(
                    children: [
                      Image.network(
                        "https://logos-world.net/wp-content/uploads/2020/08/PayPal-Symbol.png",
                        fit: BoxFit.cover,
                        width: 20,
                      ),
                      Text("PayPal", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        activeColor: Colors.blue, // PayPal blue
                        value: value,
                        onChanged: (bool? newValue) {
                          setState(() {
                            value = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Image.network(
                        "https://media.istockphoto.com/id/1215256045/vector/safe-payment-logo-template-designs-vector-illustration.jpg?s=612x612&w=0&k=20&c=22EA9Y3-gToqirb3PlgCqjnoprrgXyPAvO4_CZmT2Jc=",
                        fit: BoxFit.cover,
                        width: 50,
                      ),
                      Text("Credit Card", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        activeColor: Colors.blue, // PayPal blue
                        value: value,
                        onChanged: (bool? newValue) {
                          setState(() {
                            value = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Image.network(
                        "https://media.istockphoto.com/id/1423550966/vector/profit-rounded-lines-icon.jpg?s=612x612&w=0&k=20&c=_KFEK2PUIlquKGVUYQ18I2rO6xQ3ieFDEx-xHpXRLTI=",
                        fit: BoxFit.cover,
                        width: 50,
                      ),
                      Text("Cash", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        activeColor: Colors.blue, // PayPal blue
                        value: value,
                        onChanged: (bool? newValue) {
                          setState(() {
                            value = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Add method payment", style: TextStyle(fontSize: 20)),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: Colors.blue, size: 35),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          // height: 30,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Check Out",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
