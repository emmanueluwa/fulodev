import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fulodev/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.black),
                ),
                child: Image.asset(
                  "assets/draft_portfolio_image.png",
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            TabsMobile(text: "Home", route: "/"),
            SizedBox(height: 20.0),
            TabsMobile(text: "Works", route: "/works"),
            SizedBox(height: 20.0),
            TabsMobile(text: "Blog", route: "/blog"),
            SizedBox(height: 20.0),
            TabsMobile(text: "About", route: "/about"),
            SizedBox(height: 20.0),
            TabsMobile(text: "Contact", route: "/contact"),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async =>
                      await launchUrl(Uri.parse("https://www.instagram.com/")),
                  icon: SvgPicture.asset(
                    "assets/instagram.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async =>
                      await launchUrl(Uri.parse("https://www.twitter.com/")),
                  icon: SvgPicture.asset(
                    "assets/twitter.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async => await launchUrl(
                    Uri.parse("https://www.github.com/emmanueluwa"),
                  ),
                  icon: SvgPicture.asset(
                    "assets/github.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 35.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 25.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 80.0,
          ),
          child: Wrap(
            runSpacing: 20.0,
            spacing: 20.0,
            alignment: WrapAlignment.center,
            children: [
              SansBold("Contact me", 35.0),
              TextForm(
                text: "Name",
                containerWidth: widthDevice / 1.4,
                hintText: "Please enter your first name.",
              ),
              TextForm(
                text: "Company",
                containerWidth: widthDevice / 1.4,
                hintText: "Please enter your company name.",
              ),
              TextForm(
                text: "Phone number",
                containerWidth: widthDevice / 1.4,
                hintText: "Please enter your phone number.",
              ),
              TextForm(
                text: "Email",
                containerWidth: widthDevice / 1.4,
                hintText: "Please enter your email.",
              ),
              TextForm(
                text: "Message",
                containerWidth: widthDevice / 1.4,
                hintText: "Please enter your message.",
                maxLines: 10,
              ),

              MaterialButton(
                onPressed: () {},
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 60.0,
                minWidth: widthDevice / 2.2,
                color: Colors.redAccent,
                child: SansBold("Submit", 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
