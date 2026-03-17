import 'package:flutter/material.dart';
import '../DataApi/DataApi.dart';
import 'ProductDetails.dart';

class DetailProducts extends StatelessWidget {
  const DetailProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 7,
            childAspectRatio: 0.7,
          ),
          itemCount: productfeature.length,
          itemBuilder: (context, index) {
            final item = productfeature[index];
            return Container(
              width: 150,
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ), // Space between items
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item['image'],
                          height: 120, // Give the image a fixed height
                          width: 150, // Match the container width
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color:
                                Colors.white70, // Semi-transparent background
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons
                                .favorite_border, // Or Icons.favorite if it is liked
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    item['title'] ?? "No Title",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${item['price']}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      // Using a smaller icon button to fit the narrow 3-column width
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Productdetails(products: item),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
