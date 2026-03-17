import 'package:flutter/material.dart';
import '../DataApi/DataApi.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController searchController = TextEditingController();

  List productsList = productfeature;
  List filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = productsList;
  }

  void searchProduct(String query) {
    final results = productsList.where((product) {
      final title = product['title'].toString().toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search by title...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                            searchProduct("");
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  searchProduct(value);
                },
              ),
            ),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final products = filteredList[index];
                  return Card(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    clipBehavior: Clip.antiAlias, // important!
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            products['image'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  products['title'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                "\$ ${products['price']}",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add, color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
