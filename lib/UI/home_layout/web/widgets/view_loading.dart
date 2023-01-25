import 'package:flutter/material.dart';

//dependencies

//file addresses

class ViewLoading extends StatefulWidget {
  const ViewLoading({super.key});

  @override
  State<ViewLoading> createState() => _ViewLoadingState();
}

class _ViewLoadingState extends State<ViewLoading> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        // backgroundColor: Colors.black,
        body: Container(
      width: w,
      height: h,
      color: Colors.black,
      child: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/logos/logo_barberia_fnegro.png',
              height: 300,
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.elasticIn,
              duration: const Duration(milliseconds: 1300),
              builder: (context, value, child) => Transform.translate(
                offset: Offset(0, 1.0 * value),
                child: Image.asset(
                  'assets/logos/logo_barberia_color.png',
                  height: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}


//initState and dispose

  /* vOY A VER SI PUEDO ARMAR LA ANIMACION DE AGUA CARGANDO CON LA IMAGEN DEL LOGO QUE 3ES LO QUE HIZO UN CHABON EN TIKTOK */
  // late AnimationController firstController;
  // late Animation<double> firstAnimation;
  
  // late AnimationController secondController;
  // late Animation<double> secondAnimation;
  
  // late AnimationController thirdController;
  // late Animation<double> thirdAnimation;
  
  // late AnimationController fourthController;
  // late Animation<double> fourthAnimation;
  
  // @override
  // void initState() {
  //   //!FirstConfg
  //   firstController = AnimationController(
  //     vsync: this,
  //     duration: const Duration( milliseconds: 1500 ), 
  //   );
  //   firstAnimation = Tween<double>( begin: 1.9 , end: 2.1 ).animate(
  //     CurvedAnimation(parent: firstController, curve: Curves.easeInOut )
  //   )..addListener(() {
  //     setState(() {
        
  //     });
  //   })
  //   ..addStatusListener((status) {
      
  //     if( status == AnimationStatus.completed ) {
  //       firstController.reverse();
  //     } else {
  //       if ( status == AnimationStatus.dismissed ) {
  //         firstController.forward();
  //         }
  //       }
  //   });
    
  //   //!SecondConfig
  //   secondController = AnimationController(
  //     vsync: this,
  //     duration: const Duration( milliseconds: 1500 ),
  //   );
  //   secondAnimation = Tween<double>( begin: 1.8, end: 2.4 ).animate(
  //     CurvedAnimation(parent: secondController, curve: Curves.easeInOut))..addListener(() {
  //       setState(() {});
  //     })..addStatusListener((status) {
  //       if( status == AnimationStatus.completed ) {
  //         secondController.reverse();
  //       } else if( status == AnimationStatus.dismissed ) {
  //         secondController.forward();
  //       }
  //     });
    
  //   //!ThirdConfig
  //   thirdController = AnimationController(
  //     vsync: this,
  //     duration: const Duration( milliseconds: 1500 ),
  //   );
  //   thirdAnimation = Tween<double>( begin: 1.8, end: 2.4 ).animate(
  //     CurvedAnimation(parent: thirdController, curve: Curves.easeInOut ))..addListener(() {
  //       setState(() {});
  //     })..addStatusListener((status) {
  //       if( status == AnimationStatus.completed ) {
  //         thirdController.reverse();
  //       } else if( status == AnimationStatus.dismissed ) {
  //         thirdController.forward();
  //       }
  //     });
    
  //   //!FourthConfig
  //   fourthController = AnimationController(
  //     vsync: this,
  //     duration: const Duration( milliseconds: 1500));
  //    fourthAnimation = Tween<double>( begin: 1.9, end: 2.1 ).animate(
  //     CurvedAnimation(parent: fourthController, curve: Curves.easeInOut)
  //    )..addListener(() {
  //     setState(() {});
  //    })..addStatusListener((status) {
  //     if( status == AnimationStatus.completed ) {
  //       fourthController.reverse();
  //     } else if ( status == AnimationStatus.dismissed ) {
  //       fourthController.forward();
  //     }
  //    });
     
  //    Timer(const Duration( seconds: 2), () {
  //       firstController.forward();
  //     });
  //    Timer(const Duration( milliseconds: 1600 ), () {
  //       secondController.forward();
  //     });
  //    Timer(const Duration( milliseconds: 800 ), () {
  //       thirdController.forward();
  //     });
  //     fourthController.forward();
     
  //   super.initState();
  // }
  
  // @override
  // void dispose() {
  //   firstController.dispose();    
  //   secondController.dispose();   
  //   thirdController.dispose();  
  //   fourthController.dispose(); 
  //   super.dispose();
  // }
  
  
// Objetc painter
//   CustomPaint(
      //   painter: MyPainter(firstValue: firstAnimation.value, secondValue: secondAnimation.value, thirdValue: thirdAnimation.value, fourthValue: fourthAnimation.value),
      //   child: SizedBox(
      //     height: h,
      //     width: w,
      //   ),       
      // )
      
      
//class Painter
// class MyPainter extends CustomPainter {
//   final double firstValue;
//   final double secondValue;
//   final double thirdValue;
//   final double fourthValue;
//   MyPainter({
//     required this.firstValue,
//     required this.secondValue,
//     required this.thirdValue,
//     required this.fourthValue,
//   });
  
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//     ..color = Color(0xff3b6aba).withOpacity(.8)
//     ..style = PaintingStyle.fill;    
    
//     var path = Path()
//     ..moveTo(0, size.height / firstValue )
//     ..cubicTo(size.width * .4, size.height / secondValue, size.width * .7, size.height / thirdValue, size.width, size.height / fourthValue)
//     ..lineTo(size.width, size.height)
//     ..lineTo(0, size.height);
    
//     canvas.drawPath(path, paint);
//   }
  
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
