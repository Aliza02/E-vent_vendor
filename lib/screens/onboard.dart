import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:event_vendor/models/onboardpage_model.dart';

class onboard extends StatefulWidget {
  const onboard({super.key});

  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  int currentindex = 0;
  PageController? _pagescontroller;

  void initState() {
    super.initState();
    _pagescontroller = PageController(initialPage: 0);
  }

  void dispose() {
    _pagescontroller!.dispose();
    super.dispose();
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.015,
      width: currentindex == index
          ? MediaQuery.of(context).size.width * 0.1
          : MediaQuery.of(context).size.width * 0.05,
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: currentindex == index ? Colors.white : Color(0xFFFFDDFDF),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView.builder(
          controller: _pagescontroller,
          itemCount: content.length,
          onPageChanged: (int index) {
            setState(() {
              currentindex = index;
            });
          },
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                    0.4,
                    1,
                  ],
                      colors: [
                    Color(content[index].color1),
                    Color(content[index].color2),
                  ])),
              height: height,
              width: width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            width * 0.3, height * 0.04, 0.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            content.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0.0, height * 0.04, 0.0, 0.0),
                        padding: EdgeInsets.all(width * 0.01),
                        child: currentindex < content.length - 1
                            ? TextButton(
                                onPressed: () {
                                  _pagescontroller?.jumpToPage(2);
                                },
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'averia',
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              )
                            : Text(''),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, height * 0.06, 0.0, 0.0),
                    child: Image.asset(
                      content[index].image,
                      height: height * 0.35,
                      width: width * 0.9,
                    ),
                  ),
                  Container(
                    height: height * 0.15,
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01, horizontal: width * 0.03),
                    alignment: Alignment.center,
                    child: Text(
                      content[index].heading,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.08,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'averia',
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.12,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    alignment: Alignment.center,
                    child: Text(
                      content[index].description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.05,
                        fontFamily: 'averia',
                      ),
                    ),
                  ),
                  currentindex == content.length - 1
                      ? Container(
                          width: width * 0.6,
                          height: height * 0.1,
                          margin:
                              EdgeInsets.fromLTRB(0.0, height * 0.07, 0.0, 0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Get Your first order',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'averia',
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.05,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin:
                              EdgeInsets.fromLTRB(0.0, height * 0.05, 0.0, 0.0),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              _pagescontroller?.nextPage(
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.bounceOut);
                            },
                            child: Image.asset('assets/images/arrow.png'),
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
