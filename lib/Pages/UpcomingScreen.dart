import 'package:flutter/material.dart';
import 'package:mobile_ver/components/card.dart';
import 'package:mobile_ver/components/categories.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Categories(),
            SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  cardLimited(
                      img: 'assets/merch_1.jpg',
                      text: 'High Noon Senna Gun Necklace',
                      price: '30.00'
                      ),
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
            SizedBox(height: 24),
            Text(
              'Summer Sale',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  cardUtama(
                      img: 'assets/merch_1.jpg',
                      text: 'Arcane x RockLove Firelight Ring'),
                  cardLimited(
                      img: 'assets/merch_1.jpg',
                      text: 'High Noon Senna Gun Necklace',
                      price: '30.00',
                      ),
                  // Add more cardUtama widgets here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
