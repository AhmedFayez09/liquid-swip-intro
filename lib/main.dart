import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() => runApp(const SplahScreen());

class SplahScreen extends StatefulWidget {
  static const style = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
  const SplahScreen({super.key});

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      color: Colors.indigo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/1.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: const [
              Text(
                'Kello Everyone!',
                style: SplahScreen.style,
              ),
              Text(
                "Let's ",
                style: SplahScreen.style,
              ),
            ],
          )
        ],
      ),
    ),
    Container(
      color: const Color(0xFF232323),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/2.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: const [
              Text(
                'GO to',
                style: SplahScreen.style,
              ),
              Text(
                "Know our",
                style: SplahScreen.style,
              ),
              Text(
                "Solar System",
                style: SplahScreen.style,
              ),
            ],
          )
        ],
      ),
    ),
    Container(
      color: const Color(0xFF460BA1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/3.jpg",
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Column(
            children: const [
              Text(
                'Ejoy',
                style: SplahScreen.style,
              ),
              Text(
                "the",
                style: SplahScreen.style,
              ),
              Text(
                "Journey",
                style: SplahScreen.style,
              ),
            ],
          )
        ],
      ),
    ),
    Container(
      color: Colors.deepOrange.shade700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Image.asset(
              "assets/images/4.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: const [
              Text(
                'Be',
                style: SplahScreen.style,
              ),
              Text(
                "Like",
                style: SplahScreen.style,
              ),
              Text(
                "Astronaut",
                style: SplahScreen.style,
              ),
            ],
          )
        ],
      ),
    ),
    Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 130),
            child: Image.asset(
              "assets/images/5.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: const [
              Text(
                'Feel',
                style: SplahScreen.style,
              ),
              Text(
                "the",
                style: SplahScreen.style,
              ),
              Text(
                "Moon",
                style: SplahScreen.style,
              ),
            ],
          )
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
          child: Material(
        color: Colors.white,
        type: MaterialType.circle,
        child: SizedBox(
          width: 8.0 * zoom,
          height: 8.0 * zoom,
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              LiquidSwipe(
                pages: pages,
                slideIconWidget: const Icon(Icons.arrow_back_ios),
                onPageChangeCallback: pageChangeCallback,
                waveType: WaveType.liquidReveal,
                enableSideReveal: true,
                ignoreUserGestureWhileAnimating: true,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        pages.length,
                        _buildDot,
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: TextButton(
                    onPressed: () {
                      liquidController.animateToPage(
                        page: pages.length - 1,
                        duration: 700,
                      );
                    },
                    child: const Text(
                      "Skip tp End",
                      style: SplahScreen.style,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: TextButton(
                    onPressed: () {
                      liquidController.currentPage + 1 > pages.length - 1
                          ? 0
                          : liquidController.currentPage + 1;
                    },
                    child: const Text("Next",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
