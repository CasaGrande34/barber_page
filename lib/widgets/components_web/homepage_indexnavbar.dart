import 'dart:math';

import 'package:flutter/material.dart';

class HomePageIndexNavBar extends StatefulWidget {
  HomePageIndexNavBar({Key? key}) : super(key: key);

  @override
  State<HomePageIndexNavBar> createState() => _HomePageIndexNavBarState();
}

class _HomePageIndexNavBarState extends State<HomePageIndexNavBar> {
  List<double> items = [];
  late ScrollController scrollController;
  double pixels = 0.0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    items = List.generate(10, (index) => index.toDouble());
    scrollController.addListener(() {
      setState(() {
        pixels = scrollController.position.pixels;
        // print( scrollController.position.maxScrollExtent );
      });
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width; 
    double h = MediaQuery.of(context).size.height; 
    print(h);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          //Contenido del landingpage
          SingleChildScrollView(
            controller: scrollController,
            child: Container(
              child: Column(
                children: List.generate(items.length, (index) => Align(
                  alignment: Alignment.center,
                  child: GetBoxOffset(
                    
                    //Conexion entre ambos widgets
                    offsetFunction: (offset) {
                      items[index] = offset.dy;
                    }, 
                    
                    child: Container(
                      height: 764,
                      width: w * .9,
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      child: Center(
                        child: Text(
                          'Card index $index', style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          )
                        ),
                      ),
                    ),
                  ),
                )),
              ),
            ),
          ),
          //HEADER
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              height: 45,
              width: w ,
              child: Row(
                children: List.generate(items.length, (index) => Expanded(
                  child: InkWell(
                    onTap:() {
                      
                      scrollController.animateTo(items[index], duration: const Duration( milliseconds: 1200 ), curve: Curves.easeOutBack );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Tab $index', style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  )
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GetBoxOffset extends StatefulWidget {
  
  Widget child;
  Function(Offset offset) offsetFunction;
  
  GetBoxOffset({
    Key? key,
    required this.child,
    required this.offsetFunction,
  }) : super(key: key);

  @override
  State<GetBoxOffset> createState() => _GetBoxOffsetState();
}

class _GetBoxOffsetState extends State<GetBoxOffset> {
  
  GlobalKey widgetKey = GlobalKey();
  Offset offset = Offset(0.0, 0.0);
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
      final box = widgetKey.currentContext!.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);
      widget.offsetFunction(offset);

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}