import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fulodev/components.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  var logger = Logger(printer: PrettyPrinter());

  final formKey = GlobalKey<FormState>();

  bool isSubmitting = false;

  redContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.redAccent,
          style: BorderStyle.solid,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.all(7.0),
      child: Text(text, style: GoogleFonts.openSans(fontSize: 15.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.black),
      ),
      endDrawer: DrawersMobile(),
      body: ListView(
        children: [
          //intro first section
          CircleAvatar(
            radius: 117.0,
            backgroundColor: Colors.redAccent,
            child: CircleAvatar(
              radius: 110.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/draft_portfolio_image.png"),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: SansBold("Hello I'm", 15.0),
                    ),
                    SansBold("Osasu Uwadiae", 40.0),
                    Sans("Flutter developer", 20.0),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 3.0,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin),
                      ],
                    ),
                    SizedBox(width: 40.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 9.0,
                      children: [
                        Sans("osasu@fulodev.com", 15.0),
                        Sans("+44", 15.0),
                        Sans("London", 15.0),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 90.0),

          //about me, second section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold("About me", 35.0),
                Sans(
                  "Hello! I'm Osasu Uwadiae I specialize in flutter development.",
                  15.0,
                ),
                Sans(
                  "I strive to ensure astounding performance with state of the art security for Adroid, IOS, Web and Linux",
                  15.0,
                ),
                SizedBox(height: 10.0),
                Wrap(
                  spacing: 7.0,
                  runSpacing: 7.0,
                  children: [
                    redContainer("Flutter"),
                    redContainer("FastAPI"),
                    redContainer("Android"),
                    redContainer("IOS"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 60.0),

          // third section, what i do
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold("What I do?", 35.0),
              AnimatedCard(
                imagePath: "assets/webL.png",
                text: "Web development",
                width: 300.0,
              ),
              SizedBox(height: 35.0),
              AnimatedCard(
                imagePath: "assets/app.png",
                text: "App development",
                fit: BoxFit.contain,
                reverse: true,
                width: 300.0,
              ),
              SizedBox(height: 35.0),
              AnimatedCard(
                imagePath: "assets/python.png",
                text: "Backend",
                width: 300.0,
              ),
              SizedBox(height: 60.0),

              // contact, fourth section
              ContactFormMobile(),
              SizedBox(height: 20.0),
            ],
          ),
        ],
      ),
    );
  }
}
