import 'package:flutter/material.dart';

class cardUtama extends StatelessWidget {
  const cardUtama({required this.img, required this.text});

  final String img;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 175,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "$img",
                height: 180,
              ),
            ),
            SizedBox(height: 12),
            Text(
              '$text',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // RatingBar.builder(
            //   initialRating: 4,
            //   minRating: 1,
            //   direction: Axis.horizontal,
            //   itemCount: 5,
            //   itemSize: 14,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 0),
            //   itemBuilder: (context, _) => Icon(
            //     Icons.star,
            //     color: Colors.red,
            //   ),
            //   onRatingUpdate: (Index) {},
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$10',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 24.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget cardLimited(
    {required String img, required String text, required String price}) {
  return Container(
    margin: EdgeInsets.only(
      right: 12,
      left: 12,
      bottom: 8,
    ),
    
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 230, 230, 230).withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
        )
      ],
    ),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  "$img",
                  height: 220,
                ),
              ),
              SizedBox(height: 0),
              Text(
                '$text',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '\$ ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      Text(
                        '$price',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 24.0,
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(topRight: Radius.circular(12))),
            child: Text(
              'Limited Edition',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
