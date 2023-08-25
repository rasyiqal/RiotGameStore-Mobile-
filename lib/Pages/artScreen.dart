import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ver/components/card.dart';
import 'package:mobile_ver/components/searhDelegate.dart';

class artScreen extends StatefulWidget {
  const artScreen({super.key});

  @override
  State<artScreen> createState() => _artScreenState();
}

final List<String> categories = [
  'food',
  'Fruits',
  'Sports',
  'Vehicle',
  'Sports',
  'Vehicle',
];

List<Widget> cardData = [
  cardLimited(
    img: 'assets/merch_1.jpg',
    text: 'High Noon Senna Gun Necklace',
    price: '30.00'
  ),
  cardUtama(
    img: 'assets/merch_1.jpg',
    text: 'Convergence: A League of Legends Story Collectors Edition',
  ),
  cardUtama(
    img: 'assets/merch_1.jpg',
    text: 'RockLove Star Guardian "Hope" Locket',
  ),
  cardUtama(
    img: 'assets/merch_1.jpg',
    text: 'RockLove Star Guardian "Hope" Locket',
  ),
];

class _artScreenState extends State<artScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
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
            ListProduct(),
          ],
        ),
      ),
    );
  }
}

Container ListProduct() {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 12,
    ),
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.6,
      ),
      itemCount: cardData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return cardData[index];
      },
    ),
  );
}
