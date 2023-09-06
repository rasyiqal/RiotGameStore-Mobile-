import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ver/components/card.dart';
import 'package:mobile_ver/components/searhDelegate.dart';
import 'package:mobile_ver/controller/FetchData.dart';

class FuturedScreen extends StatefulWidget {
  const FuturedScreen({super.key});

  @override
  State<FuturedScreen> createState() => _FuturedScreenState();
}

final List<String> categories = [
  'VALORANT collection',
  'MSI 2023 collection',
  'MobyFox Watch Strap collection',
  'Arcane collection',
];

Set<String> selectedCategories = Set();

class _FuturedScreenState extends State<FuturedScreen> {
  late Future<List<dynamic>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    try {
      List<dynamic> fetchedData = await FetchDataApi.fetchData();
      return fetchedData;
    } catch (e) {
      // Handle error
      print(e.toString());
      return [];
    }
  }

  List<String> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8A0707),
        title: Text(
          'Futured',
          style: TextStyle(),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 16,
              left: 12,
              bottom: 12,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Row(
                  children: categories
                      .map(
                        (category) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: FilterChip(
                            label: Text(category),
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  selectedCategories.add(category);
                                } else {
                                  selectedCategories.remove(category);
                                }
                              });
                            },
                            selected: selectedCategories.contains(category),
                            selectedColor: Color(0xFF8A0707),
                            labelStyle: TextStyle(
                              color: selectedCategories.contains(category)
                                  ? Colors.white
                                  : Color(
                                      0xFF8A0707), // Putih saat dipilih, merah saat tidak dipilih
                            ),
                            backgroundColor:
                                selectedCategories.contains(category)
                                    ? Colors.grey[300]
                                    : Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: selectedCategories.contains(category)
                                    ? Colors.transparent
                                    : Color(
                                        0xFF8A0707), // Merah saat tidak dipilih
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          FutureBuilder<List<dynamic>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<dynamic> data = snapshot.data ?? [];
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      mainAxisSpacing: 8, // Spacing between items vertically
                      childAspectRatio: (175 /
                          280), // Width / Height ratio of the cardLimited
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item = data[index];
                      String imageUrl =
                          'http://10.0.2.2/phpcrud/${item['pekerjaan']}';
                      return CardLimited(
                        img: imageUrl,
                        text: item['nama'],
                        price: item['notelp'],
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
