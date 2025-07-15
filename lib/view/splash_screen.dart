import 'dart:async';
import 'package:covid19_tracker_app/view/world_stats.dart';
import 'package:covid19_tracker_app/widget/CustomText.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//mixin is like an inteface where we just extend the property and methods of the parent class.
// it is only the special property of the dart java and kotlin both doesnt have a mixin the diff
// btw the class being extended and an interface being implemented is that you can make an obj of parent
// class if it is being extend but you cant do that in case of an interface or a  mixin .so basically in a mixin you have some properties and methods that you can use without creating the parent class variable
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  //it will help to contol the animations
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..repeat();

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => WorldStats(),),),
    ); //to hold the splash screen for some time
  }

  @override
  void dispose ()
  {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white12,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //use animated builder why animated builder because we want our logo to rotate
            AnimatedBuilder(
                animation: _controller,
                //animation builder requires an animation for that need to make a controller for that we need to use tickerproviderstatemixin it helps  to build animations
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image(image: AssetImage('assets/images/img_1.png')),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child:
                        child, //child that will be rotated//this child will be the child of builder
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            CustomText(text: 'Covid-19 \n Tracker app'),
            //Text('Covid-19 \n Tracker app'),
          ],
        ),
      ),
    );
  }
}
