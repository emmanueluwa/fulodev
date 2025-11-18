import 'package:flutter/material.dart';
import 'package:fulodev/components.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25.0, color: Colors.black),
        title: Row(
          children: [
            Spacer(flex: 3),
            TabsWeb("Home"),
            Spacer(),
            TabsWeb("Projects"),
            Spacer(),
            TabsWeb("Blog"),
            Spacer(),
            TabsWeb("About"),
            Spacer(),
            TabsWeb("Contact"),
            Spacer(),
          ],
        ),
      ),
      body: CircleAvatar(
        radius: 147.0,
        backgroundColor: Colors.redAccent,
        child: CircleAvatar(
          radius: 143.0,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 140.0,
            backgroundImage: AssetImage("assets/draft_portfolio_image.png"),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
