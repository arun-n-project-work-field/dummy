import 'package:assignment/modules/dashboard/views/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:social_share/social_share.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.fill, width: 1500.0),
                  Positioned(
                      bottom: 0.0, left: 0.0, right: 0.0, child: Container()),
                ],
              )),
        ))
    .toList();

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Description",
          style: TextStyle(color: Colors.blueGrey[800]),
        ),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios, color: Colors.blueGrey[800], size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DashboardPage()),
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Container(
                height: 400,
                width: 600,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.transparent),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(children: [
                  SizedBox(
                    height: 340,
                    width: 700,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      child: ImageSlideshow(
                        indicatorColor: Colors.white,
                        onPageChanged: (value) {
                          debugPrint('Page changed: $value');
                        },
                        autoPlayInterval: 100000,
                        isLoop: false,
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://images.pexels.com/photos/237272/pexels-photo-237272.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.cloud_download_outlined,
                        color: Colors.grey[600],
                        size: 30,
                      ),
                      Icon(
                        Icons.bookmark_border_rounded,
                        color: Colors.grey[600],
                        size: 30,
                      ),
                      Icon(
                        Icons.heart_broken_outlined,
                        color: Colors.grey[600],
                        size: 30,
                      ),
                      const Icon(
                        Icons.center_focus_weak_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                      const Icon(Icons.star_border_rounded,
                          color: Colors.black, size: 30),
                      IconButton(
                        icon: const Icon(Icons.share_outlined,
                            color: Colors.black, size: 30),
                        onPressed: () {
                          SocialShare.shareOptions(
                                  "Share about Example with others.")
                              .then((data) {});
                        },
                      ),
                    ],
                  )
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.bookmark_border_rounded,
                      color: Colors.indigoAccent),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "1034",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey[800]),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(Icons.heart_broken_outlined,
                      color: Colors.indigoAccent),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "1034",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey[800]),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.lightBlueAccent,
                          size: 18,
                        ),
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.lightBlueAccent,
                          size: 18,
                        ),
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.lightBlueAccent,
                          size: 18,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.lightBlueAccent[100],
                          size: 18,
                        ),
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "3.2",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.indigoAccent),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Actor Name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800],
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Indian Actress",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Duration 20 Mins",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.wallet_outlined,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Total Average Fees \u{20B9}9,999",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800],
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      "From cardiovascular health to fitness, flexibility, balance,"
                      " stress relief, better sleep, increased cognitive performance,"
                      " and more, you can reap all of these benefits in just one"
                      " session out on the waves. So you may find yourself"
                      " wondering what are the benefits of going on a surf camp.",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "See More",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.indigoAccent),
                  ),
                ],
              ),
            ]),
          ),
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
