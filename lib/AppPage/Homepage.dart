import 'dart:ffi';
import 'package:ecommerce_app/AppPage/SeeAllProductFeature.dart';

import '../DataApi/DataApi.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 33,
                      child: ClipOval(
                        child: Image.network(
                          "https://scontent.fpnh2-2.fna.fbcdn.net/v/t39.30808-6/648845274_1464135738716592_114879430883516014_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=1d70fc&_nc_eui2=AeFuELtlzUm61nAWttxXKNmZ3FIMpqUe6H7cUgympR7ofhochJCq4QMrdNdgmRgVVt1v3sslCIoUUpUJJGgjDQ9-&_nc_ohc=zjiE2M_GOWAQ7kNvwHfeORu&_nc_oc=AdnKM2GBqdkl3xKslggy8gGMdXcKaUZkhdxp851isRVFzEeJCYI4qqAtb0ifwm6wNLc&_nc_zt=23&_nc_ht=scontent.fpnh2-2.fna&_nc_gid=bO0OLJJePKcYyCPEoQfVxQ&_nc_ss=8&oh=00_Afy0hXJa86PVGj7o_vEaiWAeJ6rTo6LQzuLkeLcOP1rZFQ&oe=69BDC3F8",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "Hello!\nHoun Seyha",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.notifications_active_outlined,
                        size: 30,
                      ),
                    ),
                    // Column(children: [Text("Hello!")]),
                  ],
                ),
              ),

              SizedBox(height: 19),
              Padding(
                padding: const EdgeInsets.only(top: 13, right: 13, left: 13),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search Here",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Column(
                children: [
                  SizedBox(
                    height: 190,
                    width: double.infinity,

                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        // This calculates the index based on scroll position
                        if (notification is ScrollUpdateNotification) {
                          // Screen width * 0.9 (your container) + 20 (your margin)
                          double itemWidth =
                              MediaQuery.of(context).size.width * 0.9 + 20;
                          setState(() {
                            currentIndex =
                                (notification.metrics.pixels / itemWidth)
                                    .round();
                          });
                        }
                        return true;
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: PageScrollPhysics(),
                        itemCount: BannerImage.length,
                        itemBuilder: (context, index) {
                          final img = BannerImage[index];
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(img, fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(BannerImage.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 10,
                        // FIX: Compare index against our tracked _currentIndex
                        width: currentIndex == index ? 25 : 10,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      );
                    }),
                  ),
                ],
              ),

              Column(
                children: [
                  Row(
                    children: [
                      const Text("Feature"),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailProducts(),
                            ),
                          );
                        },
                        child: const Text("See All"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                        200, // Increased height to fit Image + Title + Price
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: productfeature.length,
                      itemBuilder: (context, index) {
                        final item = productfeature[index];

                        return Container(
                          width: 150,
                          margin: const EdgeInsets.only(
                            right: 12,
                          ), // Space between items
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailProducts(),
                                          ),
                                        );
                                      },
                                      child: Image.network(
                                        item['image'],
                                        height:
                                            120, // Give the image a fixed height
                                        width: 150, // Match the container width
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors
                                            .white70, // Semi-transparent background
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

                              const SizedBox(height: 8),
                              Text(
                                item['title'] ?? "No Title",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "\$${item['price']}",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Popular"),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailProducts(),
                            ),
                          );
                        },
                        child: const Text("See All"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                        200, // Increased height to fit Image + Title + Price
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: productpopular.length,
                      itemBuilder: (context, index) {
                        final item = productpopular[index];

                        return Container(
                          width: 150,
                          margin: const EdgeInsets.only(
                            right: 12,
                          ), // Space between items
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailProducts(),
                                          ),
                                        );
                                      },
                                      child: Image.network(
                                        item['image'],
                                        height:
                                            120, // Give the image a fixed height
                                        width: 150, // Match the container width
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors
                                            .white70, // Semi-transparent background
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

                              const SizedBox(height: 8),
                              Text(
                                item['title'] ?? "No Title",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "\$${item['price']}",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
