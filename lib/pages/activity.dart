import 'package:flutter/material.dart';
import 'package:simple_app/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
 
class CarouselDemo extends StatefulWidget {
  CarouselDemo() : super();
 
  final String title = "UTM Sport Events";
 
  @override
  CarouselDemoState createState() => CarouselDemoState();
  
}

 
class CarouselDemoState extends State<CarouselDemo> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://sporthub.me/images/events/eae06803c7ea8b5e6f3e440928a9b4e8.jpg',
    'https://events.utm.my/wp-content/uploads/2019/09/WhatsApp-Image-2019-09-03-at-3.54.32-PM1-723x1024.jpeg',
    'https://scontent.fkul13-1.fna.fbcdn.net/v/t1.0-9/51337040_2125511634208517_4573410880498171904_n.jpg?_nc_cat=101&_nc_ohc=pAYB6pDglKgAQlHgEbgxbFhAKylq_zChfbYYzbyxPwXqw94mqzhNPKIMg&_nc_ht=scontent.fkul13-1.fna&oh=1f332064f8b0a5702d9e926678d67a75&oe=5E6709C0',
    'http://ent.evenesis.com/IMAGES/EXT/IMG/17/MAIN_POSTER_UTM.jpg',
    'https://malaysiarunner.com/img/1151595X/NREB%20ENVIRO%20RUN/runpos.jpg'
  ];
 
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(widget.title),
          backgroundColor: Colors.blue,
      ),
      drawer: NavigationDrawer(),

      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          colors: [
            Colors.blueAccent[200],
            Colors.blueGrey[100],
            Colors.deepPurpleAccent[100],
           // Colors.green,
          ],
        ),
      ),
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            carouselSlider = CarouselSlider(
              height: 400.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.redAccent : Colors.green,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: goToPrevious,
                  color: Colors.grey,
                  child: Text("<"),
                ),
                OutlineButton(
                  onPressed: goToNext,
                  child: Text(">"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
 
  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
 
  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
   }
  }