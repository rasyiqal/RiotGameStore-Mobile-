import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CaroselBuild extends StatefulWidget {
  const CaroselBuild({super.key});

  @override
  State<CaroselBuild> createState() => _CaroselBuildState();
}

class _CaroselBuildState extends State<CaroselBuild> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<String> imgList = [
  'assets/caro11.jpg',
  'assets/caro12.jpg',
];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.red.shade800,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.5,
              viewportFraction: 2,
              onPageChanged: (index, reason) {
                print(index);
                setState(() {
                  _current = index;
                });
              },
              enlargeCenterPage: false,
            ),
            items: imgList
                .map((item) => Container(
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(item, fit: BoxFit.cover),
                                Positioned(                                  
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10.0),
                                   
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ))
                .toList(),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(
              top: 24,
              right: 0,
              left: 12,
            ),
            color: Colors.transparent,
            child: SearchWidget(),
          ),
        ),
        Positioned(
          top: 220,
          left: 0,
          right: 0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white30,
                        width: 1,),
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.red.shade800)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              // Aksi ketika tombol notifikasi ditekan
            },
          ),
        ],
      ),
    );
  }
}
