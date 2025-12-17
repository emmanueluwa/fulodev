import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fulodev/components.dart';
import 'package:logger/web.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    var logger = Logger(printer: PrettyPrinter());

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.redAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/draft_portfolio_image.png"),
              ),
            ),
            SizedBox(height: 15.0),
            SansBold("Osasu Uwadiae", 30.0),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse("www://instagram.com/"));
                  },
                  icon: SvgPicture.asset(
                    "assets/instagram.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse("www://twitter.com/"));
                  },
                  icon: SvgPicture.asset(
                    "assets/twitter.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse("www://github.com/emmanueluwa"));
                  },
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
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  isAntiAlias: true,
                  cacheWidth: null, // Don't downsample
                  cacheHeight: null,
                ),
              ),
              title: Row(
                children: [
                  Spacer(flex: 3),
                  TabsWeb(title: "Home", route: "/"),
                  Spacer(),
                  TabsWeb(title: "Works", route: "/works"),
                  Spacer(),
                  TabsWeb(title: "Blog", route: "/blog"),
                  Spacer(),
                  TabsWeb(title: "About", route: "/about"),
                  Spacer(),
                  TabsWeb(title: "Contact", route: "/contact"),
                  Spacer(),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 30.0),
                SansBold("Contact me", 40.0),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          text: "Name",
                          containerWidth: 350.0,
                          hintText: "Please enter your name.",
                          controller: _nameController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "Name is required";
                            }
                          },
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                          text: "Email",
                          containerWidth: 350.0,
                          hintText: "Please enter your email.",
                          controller: _emailController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "Email is required";
                            }
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextForm(
                          text: "Company",
                          containerWidth: 350.0,
                          hintText: "Please enter your company name.",
                          controller: _companyNameController,
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                          text: "Phone number",
                          containerWidth: 350.0,
                          hintText: "Please enter your phone number.",
                          controller: _phoneController,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                TextForm(
                  text: "Message",
                  containerWidth: widthDevice / 1.5,
                  hintText: "Please enter your message.",
                  maxLines: 10,
                  controller: _messageController,
                  validator: (text) {
                    if (text.toString().isEmpty) {
                      return "Message is required";
                    }
                  },
                ),
                SizedBox(height: 20.0),
                MaterialButton(
                  onPressed: () async {
                    logger.d(_nameController.text);

                    final addData = FormService();
                    if (formKey.currentState!.validate()) {
                      await addData.addDataFromForm(
                        _nameController.text,
                        _companyNameController.text,
                        _emailController.text,
                        _phoneController.text,
                        _messageController.text,
                      );

                      formKey.currentState!.reset();

                      DialogError(context);
                    }
                  },
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.redAccent,
                  child: SansBold("Submit", 20.0),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
