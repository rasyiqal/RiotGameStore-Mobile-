import 'package:flutter/material.dart';
import 'package:mobile_ver/components/card.dart';
import 'package:mobile_ver/components/caroselimg.dart';
import 'package:mobile_ver/controller/FetchData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'see all',
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Expanded(
                  child: FutureBuilder<List<dynamic>>(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<dynamic> data = snapshot.data ?? [];
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Jumlah kolom dalam grid
                            mainAxisSpacing:
                                8, // Spasi antara item secara vertikal
                            crossAxisSpacing:
                                8, // Spasi antara item secara horizontal
                            childAspectRatio:
                                (175 / 300), // Lebar / Tinggi dari cardLimited
                          ),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> item = data[index];
                             String imageUrl = 'http://10.0.2.2/phpcrud/upload/${item['C:/xampp/htdocs/phpcrud/upload']}';
                            return cardLimited(
                              img: imageUrl,
                              text: item['nama'],
                              price: item['notelp'],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
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
              Text('Cart', style: TextStyle(color: Colors.red)),
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
