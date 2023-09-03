import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final String img;
  final String text;
  final String price;

  CheckoutPage({
    required this.img,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Color(0xFF8A0707),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xFF8A0707),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Josemite',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Addresss dreess dress',
                        style: TextStyle(
                          wordSpacing: double.tryParse('1.5'),
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(255, 189, 81, 81),
              padding: EdgeInsets.only(
                top: 8,
                right: 24,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'change your address',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            itemViewCheckout(
              img: img,
              text: text,
              price: price,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 50,
                color: Color(0xFF8A0707),
                padding: EdgeInsets.only(
                  left: 24,
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopify_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Bayar Sekarang',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

//ITEM VIEW CHECKOUT
class itemViewCheckout extends StatelessWidget {
  const itemViewCheckout({
    super.key,
    required this.img,
    required this.text,
    required this.price,
  });

  final String img;
  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: EdgeInsets.only(
        right: 24,
        left: 12,
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.network(
              img,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16), // Menggunakan SizedBox sebagai pemisah
          Expanded(
            child: Container(
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
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          text
                              .split(' ')
                              .skip(3)
                              .join(' '), // Mengambil sisanya
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
