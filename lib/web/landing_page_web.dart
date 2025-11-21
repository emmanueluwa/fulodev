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
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(size: 25.0, color: Colors.black),
        title: const Row(
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
      body: ListView(
        children: [
          //first section
          Container(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: const SansBold("Hello I'm", 15.0),
                    ),
                    const SizedBox(height: 15.0),
                    const SansBold("Osasu Uwadiae", 55.0),
                    const Sans("Flutter developer", 30.0),
                    const SizedBox(height: 15.0),
                    const Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20.0),
                        Sans("osasu@fulodev.com", 15.0),
                      ],
                    ),
                    const SizedBox(height: 10.0),

                    // const Row(
                    //   children: [
                    //     Icon(Icons.call),
                    //     SizedBox(width: 20.0),
                    //     Sans("+44", 15.0),
                    //   ],
                    // ),
                    // const SizedBox(height: 10.0),
                    const Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20.0),
                        Sans("London", 15.0),
                      ],
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.redAccent,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundImage: AssetImage(
                        "assets/draft_portfolio_image.png",
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //second dection
          Container(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/web.jpg", height: heightDevice / 1.7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SansBold("About me", 40.0),
                    const SizedBox(height: 15.0),
                    const Sans(
                      "Hello! I'm Osasu I specialise in flutter development",
                      15.0,
                    ),
                    const Sans(
                      "I strive to ensure astounding peformance with state of ",
                      15.0,
                    ),
                    const Sans(
                      "the art security for Androd, IOS, Web, Mac, Linux and Windows.",
                      15.0,
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.redAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Flutter", 15.0),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.redAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Python", 15.0),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.redAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("FastAPI", 15.0),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.redAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("AI", 15.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          //third section
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do?", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 30.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      shadowColor: Colors.redAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/webL.png",
                              height: 200.0,
                              width: 200.0,
                            ),
                            SizedBox(height: 10.0),
                            SansBold("Web development", 15.0),
                          ],
                        ),
                      ),
                    ),

                    Card(
                      elevation: 30.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      shadowColor: Colors.redAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/app.png",
                              height: 200.0,
                              width: 200.0,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 10.0),
                            SansBold("App development", 15.0),
                          ],
                        ),
                      ),
                    ),

                    Card(
                      elevation: 30.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      shadowColor: Colors.redAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/python.png",
                              height: 200.0,
                              width: 200.0,
                            ),
                            SizedBox(height: 10.0),
                            SansBold("Backend development", 15.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //fourth section
          Container(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SansBold("Contact me", 40.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          heading: "Name",
                          width: 350.0,
                          hintText: "Please enter your name",
                        ),
                        SizedBox(height: 15),
                        TextForm(
                          heading: "Email",
                          width: 350.0,
                          hintText: "Please enter your email",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          heading: "Company",
                          width: 350.0,
                          hintText: "Please enter the name of your company",
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                          heading: "Phone number",
                          width: 350.0,
                          hintText: "Please enter your phone number",
                        ),
                      ],
                    ),
                  ],
                ),
                TextForm(
                  heading: "Message",
                  width: widthDevice / 1.5,
                  hintText: "Please enter your message",
                  maxLines: 10,
                ),
                MaterialButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.redAccent,
                  child: SansBold("Submit", 20.0),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
