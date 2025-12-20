import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fulodev/components.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
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

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: DrawersMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              // introduction, first section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.redAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/draft_portfolio_image.png",
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 35.0),
                    SizedBox(height: 10.0),
                    Sans(
                      "Hello! I'm Osasu Uwadiae I specialize in flutter development.",
                      15.0,
                    ),
                    Sans(
                      "I strive to ensure astounding performance with state of the art security for Adroid, IOS, Web and Linux",
                      15.0,
                    ),
                    SizedBox(height: 15.0),
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
              SizedBox(height: 40.0),

              //web development section, second section
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(imagePath: "assets/webL.png", width: 200.0),
                  SizedBox(height: 30.0),
                  SansBold("Web development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                "I'm here to build your presence online with state of the art web apps.",
                15.0,
              ),

              // app development, third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("App development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered.",
                15.0,
              ),

              //backend development, fourth section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(imagePath: "assets/python.png", width: 200.0),
                  SizedBox(height: 30.0),
                  SansBold("Backend development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                "Do you need a scalable and secure backend? Let's have a conversation about how I can help you with that.",
                15.0,
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
