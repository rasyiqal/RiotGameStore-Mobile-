import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              UserAddressView(),
              MenuChange(
                text: 'Change Your Addres',
                onTap: () {},
              ),
              SizedBox(
                height: 12,
              ),
              itemViewCheckout(
                img: img,
                text: text,
                price: price,
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 2.0,
                  color: Color.fromARGB(255, 85, 162, 149),
                )),
                child: Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 200, 243, 235),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipping Options',
                        style: TextStyle(
                          color: Color.fromARGB(255, 85, 162, 149),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'International Shipping',
                                style: TextStyle(
                                  letterSpacing: 0.6,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'It will be received on June 12 - 16',
                                style: TextStyle(
                                  letterSpacing: 0.6,
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$ 20',
                            style: TextStyle(
                              letterSpacing: 0.6,
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              MenuChange(
                text: 'Payment Method',
                onTap: () {},
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.receipt_outlined,
                          color: Color.fromARGB(255, 138, 7, 7),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Payment Details',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subtotal for products',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '\$ $price',
                          style: TextStyle(
                            letterSpacing: 0.6,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subtotal for shipping',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '\$ 20',
                          style: TextStyle(
                            letterSpacing: 0.6,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Payment',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$ ${(double.parse(price) + 20).toStringAsFixed(2)}',
                          style: TextStyle(
                            letterSpacing: 0.6,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3, // Radius blur shadow
            offset: Offset(0, 1), // Offset shadow (x, y)
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
                  right: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$ ${(double.parse(price) + 20).toStringAsFixed(2)}',
                      style: TextStyle(
                        letterSpacing: 0.6,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    
                    Text(
                      'Total Payment',
                      style: TextStyle(
                        color: Color(0xFF8A0707),
                        letterSpacing: 0.5,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      img: img,
                      text: text,
                      price: price,
                    ),
                  ));
                },
                child: Container(
                  height: 50,
                  color: Color(0xFF8A0707),
                  child: Center(
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        letterSpacing: 0.6,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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

class MenuChange extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  MenuChange({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 237, 237, 237),
      padding: EdgeInsets.only(
        top: 8,
        right: 24,
        bottom: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Text(
              text,
              style: TextStyle(
                letterSpacing: 0.6,
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
        ],
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
      decoration: BoxDecoration(
          border: Border.all(
        color: const Color.fromARGB(255, 240, 240, 240),
        width: 1.5,
      )),
      child: Container(
        padding: EdgeInsets.only(
          right: 24,
          left: 12,
          top: 12,
          bottom: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Container(
                          width: 160,
                          child: Text(
                            '$text',
                            style: TextStyle(
                              letterSpacing: 0.6,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Text(
                          '\$ $price',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24,),
                    Text('size: --',
                    style: 
                    TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),)
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start, //Column
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAddressView extends StatelessWidget {
  const UserAddressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 300,
                child: Text(
                  'A2930 Brannon Avenue, Jacksonville, FL, Florida, zip code 32256. Telephone number (904-815-1742).',
                  style: TextStyle(
                    letterSpacing: 0.6,
                    wordSpacing: double.tryParse('1.5'),
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  maxLines: 3,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
