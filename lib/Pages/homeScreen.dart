import 'package:flutter/material.dart';
import 'package:mobile_ver/components/card.dart';
import 'package:mobile_ver/components/caroselimg.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CaroselBuild(),
            OtherMenu(),
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Seller This Month',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'see all',
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CardBuilder(),
          ],
        ),
      ),
    );
  }

  Widget CardBuilder() {
    List<Widget> cardData = [
      cardLimited(
        img: 'assets/merch_1.jpg',
        text: 'High Noon Senna Gun Necklace',
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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
}

class OtherMenu extends StatelessWidget {
  const OtherMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.red.shade800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.home,
                  size: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text('Home', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.explore,
                  size: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text('Explore', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.favorite,
                  size: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text('Favorite', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  size: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text('Cart', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text('Profile', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}

Widget ScrollView() {
  return Container(
    margin: EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'see all',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              cardLimited(
                  img: 'assets/merch_1.jpg',
                  text: 'High Noon Senna Gun Necklace'),
              cardUtama(
                  img: 'assets/merch_1.jpg',
                  text:
                      'Convergence: A League of Legends Story Collectors Edition'),
              cardUtama(
                  img: 'assets/merch_1.jpg',
                  text: 'RockLove Star Guardian "Hope" Locket'),
              // Add more cardUtama widgets here
            ],
          ),
        ),
      ],
    ),
  );
}

Widget SearchBar() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
  );
}
