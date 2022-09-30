import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey[900],
          textTheme: TextTheme(bodyText1: TextStyle(), bodyText2: TextStyle())
              .apply(bodyColor: Colors.white, displayColor: Colors.blue)),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://assets7.lottiefiles.com/private_files/lf30_vfaddvqs.json',
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Ever Wanted to message someone in Whatsapp without saving their number? Well you could just do it here!',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GlassContainer(
                height: 200,
                width: 350,
                blur: 4,
                color: Colors.white.withOpacity(0.1),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                    Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                  ],
                ),
                //--code to remove border
                border: Border.fromBorderSide(BorderSide.none),
                shadowStrength: 5,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Enter the number with its country code you want to reach in Whatsapp.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 35,
                      width: 300,
                      child: TextField(
                        controller: myController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 35 / 2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            hintText: 'eg. 91 9876543210',
                            fillColor: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          print(myController.text);
                          var whatsapp = myController.text;
                          var whatsappURl_android =
                              "whatsapp://send?phone=" + whatsapp;
                          await launch(whatsappURl_android);
                        },
                        child: Text('Go to chat')),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Made with ❤️ in Earth ⚡ Powered by coarde')
            ],
          ),
        ),
      ),
    );
  }
}
