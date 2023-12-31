import 'package:flutter/material.dart';
import 'package:mobile_ver/components/card.dart';
import 'package:mobile_ver/components/searhDelegate.dart';
import 'package:mobile_ver/controller/FetchData.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _chartScreen();
}

final List<String> categories = [
  'food',
  'Fruits',
  'Sports',
  'Vehicle',
  'Sports',
  'Vehicle',
];

class _chartScreen extends State<ChartScreen> {
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
        backgroundColor: Colors.red.shade400,
        title: Text(
          'Art',
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
              child: Row(
                children: categories
                    .map((category) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: FilterChip(
                              label: Text(category),
                              onSelected: (selected) {}),
                        ))
                    .toList(),
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
                      childAspectRatio: (175/280), // Width / Height ratio of the cardLimited
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item = data[index];
                      String imageUrl =
                          'http://10.0.2.2/LocalAPi/RiotGameStore-Mobile-/${item['gambar']}';
                      return CardLimited(
                        img: imageUrl,
                        text: item['nama'],
                        price: item['harga'],
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