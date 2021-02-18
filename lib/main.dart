import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:gif_app/components/app_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gif App Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  GifController controller;
  Color kLightBlue = Color(0xFFbbdefb);
  Color kDarkBlue = Color(0xFF000051);
  Color kGrey = Color(0xFF7C7C7C);

  String gif = 'login';

  @override
  void initState() {
    controller = GifController(vsync: this);
    super.initState();
  }

  playGif() {
    controller.value = 0;
    controller.animateTo(23,
        duration: Duration(milliseconds: (140 * 25).toInt()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: ListView(
                    padding: EdgeInsets.only(top: 170),
                    shrinkWrap: true,
                    children: [
                      AppButton(
                        btnColor: kLightBlue,
                        title: 'Login',
                        textColor: kDarkBlue,
                        onPress: () {
                          setState(() {
                            gif = 'login';
                          });
                          playGif();
                          print('Login pressed');
                        },
                        onDoublePress: () {
                          print('Login 2x pressed');
                          //Navigator.pushNamed(context, LoginScreen.id);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppButton(
                        btnColor: kDarkBlue,
                        title: 'Nuevo Usuario',
                        textColor: Colors.white,
                        onPress: () {
                          setState(() {
                            gif = 'registro';
                          });
                          playGif();
                          print('Registration pressed');
                        },
                        onDoublePress: () {
                          print('Registration 2x pressed');
                          //Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Card(
                      child: GifImage(
                        controller: controller,
                        image: AssetImage('images/$gif.gif'),
                        fit: BoxFit.fill,
                      ),
                      elevation: 7,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 58.0,
                      width: 58.0,
                      decoration: BoxDecoration(
                        color: kDarkBlue,
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: [
                          BoxShadow(
                            color: kDarkBlue.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {
                            if (gif == 'login') {
                              print('Go to login');
                              //Navigator.pushNamed(context, LoginScreen.id);
                            } else if (gif == 'registro') {
                              print('Go to registration');
                              //Navigator.pushNamed(context, RegistrationScreen.id);
                            }
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
