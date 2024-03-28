// ignore_for_file: file_names, avoid_print, prefer_const_constructors, library_private_types_in_public_api

import 'package:final_app/ui/questions.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HPage extends StatefulWidget {
  const HPage({Key? key}) : super(key: key);

  @override
  _HPageState createState() => _HPageState();
}

class _HPageState extends State<HPage> {
  late final PageController _pageController;
  late final List<String> _imagePaths;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _imagePaths = [
      "assets/images/IMG-20240319-WA0030.jpg",
      "assets/images/IMG-20240319-WA0033.jpg",
      "assets/images/IMG-20240319-WA0034.jpg",
    ];
    _pageController = PageController();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    Timer.periodic(Duration(seconds: 10), (timer) {
      if (_currentPageIndex < _imagePaths.length - 1) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.6; // 80% of screen width
    double containerHeight = containerWidth * 1.5; // Aspect ratio of 3:2

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // first part that has image slider
            // SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width, // Width of the screen
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 70.0,
                bottom: 20.0,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 55, 114, 167), // Background color
                borderRadius: BorderRadius.zero,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      // "\n"
                      "Your AI-Powered TB\n"
                      " and CPA Diagnosis",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: containerHeight,
                          width: containerWidth,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _imagePaths.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  _imagePaths[index],
                                  fit: BoxFit.cover,
                                  width: containerWidth,
                                  height: containerHeight,
                                  // width: 20,
                                ),
                              );
                            },
                            onPageChanged: (index) {
                              setState(() {
                                _currentPageIndex = index;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _imagePaths.length,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              width: 13,
                              height: 13,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPageIndex == index
                                    ? Colors.white
                                    : Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // after the pictures part
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.zero,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 10.0,
                      bottom: 15.0,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Early Detection\n"
                        "Makes a Difference",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // part for reading more
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 11.0),
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 10.0,
                                  bottom: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors
                                      .lightBlueAccent, // Background color
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Our scanner can help you to "
                                        "distinguish between Active TB "
                                        "and CPA",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.fingerprint_outlined,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 30.0,
                                    right: 20.0,
                                    // top: 10.0,
                                    bottom: 15.0,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Kumbucha!",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border:
                                      Border.all(color: Colors.blue, width: 1),
                                  // color: Colors.lightBlueAccent,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Questions()),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 90.0),
                                    child: Text(
                                      "Read more",
                                      style: TextStyle(
                                        fontSize: 18,
                                        // fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 127, 171, 207),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // part to check how many patients have been tested varying in different categories 
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 9.0),
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 5.0,
                                  // right: 15.0,
                                  top: 10.0,
                                  bottom: 12.0,
                                ),
                                child: Row(
                                  children: [
                                    // Expanded(
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(35),
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    // ),
                                    SizedBox(width: 10),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Container(
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                "\u2022",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: "Without Active TB or CPA\n",
                                            style: TextStyle(
                                              fontSize: 13, // Text size
                                              color: Colors.black,
                                            ),
                                          ),
                                          // TextSpan(
                                          //   text: "0",
                                          //   style: TextStyle(
                                          //     fontSize: 13,
                                          //     fontWeight: FontWeight.bold,
                                          //     color: Colors.black,
                                          //   ),
                                          // ),
                                          WidgetSpan(
                                            child: Container(
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                "\u2022",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: "With Active TB\n",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          // TextSpan(
                                          //   text: "0",
                                          //   style: TextStyle(
                                          //     fontSize: 13,
                                          //     fontWeight: FontWeight.bold,
                                          //     color: Colors.black,
                                          //   ),
                                          // ),
                                          WidgetSpan(
                                            child: Container(
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                "\u2022",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: "With CPA",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          // TextSpan(
                                          //   text: "0",
                                          //   style: TextStyle(
                                          //     fontSize: 13,
                                          //     fontWeight: FontWeight.bold,
                                          //     color: Colors.black,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      "0\n\n"
                                      "0\n\n"
                                      "0",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}