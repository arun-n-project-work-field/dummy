import 'package:assignment/modules/auth/views/login_page.dart';
import 'package:assignment/modules/description/views/description_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/1181396/pexels-photo-1181396.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/935949/pexels-photo-935949.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/3183197/pexels-photo-3183197.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/1647919/pexels-photo-1647919.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1500.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Popular Meetups',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'in India',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _current = 2;
  final CarouselController _controller = CarouselController();
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Individual Meetup",
          style: TextStyle(color: Colors.blueGrey[800]),
        ),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios, color: Colors.blueGrey[800], size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 10),
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.blueGrey[800],
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.mic_none_rounded,
                        color: Colors.blueGrey[800],
                      ),
                      onPressed: () {},
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(fontWeight: FontWeight.normal),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9, right: 9),
              child: SizedBox(
                width: 500,
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: 200,
                      pageSnapping: true,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      enlargeCenterPage: false,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 7,
                    height: 7,
                    margin: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Trending Popular People",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey[800]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: SizedBox(
                          height: 150,
                          width: 275,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            margin: const EdgeInsets.all(0),
                            child: Image.network(
                              'https://images.pexels.com/photos/1647919/pexels-photo-1647919.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Top Trending Meetups",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey[800]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: SizedBox(
                          height: 200,
                          width: 150,
                          child: GestureDetector(
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                                margin: const EdgeInsets.all(0),
                                child: Image.network(
                                  'https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DescriptionPage()),
                                );
                              }),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox.fromSize(
                size: const Size(56, 56),
                child: ClipOval(
                  child: Material(
                      color: Colors.white12,
                      child: InkWell(
                          splashColor: Colors.cyan,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.home_outlined,
                                color: _selectedIndex == 0
                                    ? Colors.cyan[400]
                                    : Colors.black,
                              ),
                              Text(
                                "Home",
                                style: TextStyle(
                                    color: _selectedIndex == 0
                                        ? Colors.cyan[400]
                                        : Colors.black,
                                    fontSize: 13),
                              )
                            ],
                          ))),
                )),
            SizedBox.fromSize(
                size: const Size(56, 56),
                child: ClipOval(
                  child: Material(
                      color: Colors.white12,
                      child: InkWell(
                          splashColor: Colors.cyan,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.window_outlined,
                                color: _selectedIndex == 1
                                    ? Colors.cyan[400]
                                    : Colors.black,
                              ),
                              Text(
                                "Prole",
                                style: TextStyle(
                                    color: _selectedIndex == 1
                                        ? Colors.cyan[400]
                                        : Colors.black,
                                    fontSize: 13),
                              )
                            ],
                          ))),
                )),
            SizedBox.fromSize(
                size: const Size(56, 56),
                child: ClipOval(
                  child: Material(
                      color: Colors.white12,
                      child: InkWell(
                          splashColor: Colors.cyan,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.handshake_outlined,
                                color: _selectedIndex == 2
                                    ? Colors.cyan[400]
                                    : Colors.black,
                              ),
                              Text(
                                "Meetup",
                                style: TextStyle(
                                    color: _selectedIndex == 2
                                        ? Colors.cyan[400]
                                        : Colors.black,
                                    fontSize: 13),
                              )
                            ],
                          ))),
                )),
            SizedBox.fromSize(
                size: const Size(56, 56),
                child: ClipOval(
                  child: Material(
                      color: Colors.white12,
                      child: InkWell(
                          splashColor: Colors.cyan,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.snippet_folder_outlined,
                                color: _selectedIndex == 3
                                    ? Colors.cyan[400]
                                    : Colors.black,
                              ),
                              Text(
                                "Explore",
                                style: TextStyle(
                                    color: _selectedIndex == 3
                                        ? Colors.cyan[400]
                                        : Colors.black,
                                    fontSize: 13),
                              )
                            ],
                          ))),
                )),
            SizedBox.fromSize(
              size: const Size(57, 57),
              child: ClipOval(
                child: Material(
                    color: Colors.white12,
                    child: InkWell(
                        splashColor: Colors.cyan,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 4;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.person_outline_rounded,
                              color: _selectedIndex == 4
                                  ? Colors.cyan[400]
                                  : Colors.black,
                            ),
                            Text(
                              "Account",
                              style: TextStyle(
                                  color: _selectedIndex == 4
                                      ? Colors.cyan[400]
                                      : Colors.black,
                                  fontSize: 13),
                            )
                          ],
                        ))),
              ),
            )
          ])),
    );
  }
}
