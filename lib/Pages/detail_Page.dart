import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String img;
  final String text;
  final String price;

  DetailPage({
    required this.img,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$text'),
        backgroundColor: Color(0xFF8A0707),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.network(
                img,
                height: 330,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Wrap(
                      children: [
                        Text(
                          text
                              .split(' ')
                              .take(3)
                              .join(' '), // Mengambil dua kata pertama
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          text
                              .split(' ')
                              .skip(3)
                              .join(' '), // Mengambil sisanya
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            // Content
            SizedBox(
              height: 32,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Futured',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'asdasdasdasdasdasdasdasdasdasdsadasdasdasdasd asdasdasdasdasdasd asdasd asds asdasd',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Warna shadow
            spreadRadius: 3, // Radius penyebaran shadow
            blurRadius: 3, // Radius blur shadow
            offset: Offset(0, 1), // Offset dari shadow (x, y)
          ),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 50,
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: 24,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_basket,
                      color: Color(0xFF8A0707),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Tambah Keranjang',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                color: Color(0xFF8A0707),
                child: Center(
                  child: Text(
                    'Buat Pesanan',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
