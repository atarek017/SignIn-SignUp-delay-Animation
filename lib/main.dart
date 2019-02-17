import 'package:flutter/material.dart';
import 'package:login_animation_delay/sign_up.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin it reports back information about every frame of animation
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    //Tween:-  used for giving input and output range of animation, what should happen in this animation, how animation sholud start
    //Interval;- delay between animation
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: welcome(),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        delayedAnimation.value * width, 0.0, 0.0),
                    child: loginput(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        muchDelayedAnimation.value * width, 0.0, 0.0),
                    child: lastWidget(),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget welcome() {
    return Container(
      alignment: Alignment(0.0, -0.40),
      height: 100.0,
      color: Colors.white,
      child: Text(
        'Welcome back',
        style: TextStyle(
            color: Color(0xFF36BA7A), fontFamily: 'Montserrat', fontSize: 20.0),
      ),
    );
  }

  Widget loginput() {
    return Center(
      child: Container(
        width: 220,
        height: 230,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.grey)]),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              height: 4,
              color: Color(0xFF36BA7A),
            ),
            ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text("Login",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.account_circle, color: Colors.black),
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 14),
                        fillColor: Colors.black),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security, color: Colors.black),
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 14),
                        fillColor: Colors.black),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 200,
              right: 20,
              child: Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xFF36BA7A),
                ),
                child: FlatButton(
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lastWidget() {
    return Container(
      height: 100.0,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          FlatButton(
            child: Text(
              'Forget password',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Montserrat', fontSize: 12.0),
            ),
            onPressed: () {},
          ),
          FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Do not have an acount? ",
                  style: TextStyle(color: Colors.black87),
                ),
                Text(
                  "SignUp",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            onPressed: () {
               Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => SignUp()));
            },
          )
        ],
      ),
    );
  }
}
