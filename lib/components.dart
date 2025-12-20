//file for widgets used throughout the app
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fulodev/config/api_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:logger/web.dart';
import 'package:url_launcher/url_launcher.dart';

//variables
final TextEditingController _nameController = TextEditingController();
final TextEditingController _companyNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

final formKey = GlobalKey<FormState>();

// classes and methods
class TabsWeb extends StatefulWidget {
  final title;
  final route;

  const TabsWeb({super.key, this.title, this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },

        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },

        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.roboto(
                  shadows: [
                    const Shadow(color: Colors.black, offset: Offset(0, -8)),
                  ],
                  color: Colors.transparent,
                  fontSize: 25.0,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.redAccent,
                )
              : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
          child: Text(widget.title),
        ),
      ),
    );
  }
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;

  const TabsMobile({super.key, @required this.text, @required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
    );
  }
}

urlLauncher(String imgPath, String url) {
  return IconButton(
    icon: SvgPicture.asset(imgPath, color: Colors.black, width: 35.0),
    onPressed: () async {
      await launchUrl(Uri.parse(url));
    },
  );
}

class DrawersWeb extends StatelessWidget {
  const DrawersWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.redAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/draft_portfolio_image.png"),
            ),
          ),
          const SizedBox(height: 15.0),
          const SansBold("Osasu Uwadiae", 30.0),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg", "https://www.instagram.com/"),
              urlLauncher("assets/twitter.svg", "https://x.com/fuloXXXX/"),
              urlLauncher(
                "assets/github.svg",
                "https://github.com/emmanueluwa/",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawersMobile extends StatelessWidget {
  const DrawersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              urlLauncher("assets/instagram.svg", "https://www.instagram.com/"),
              urlLauncher("assets/twitter.svg", "https://x.com/fuloXXXX/"),
              urlLauncher(
                "assets/github.svg",
                "https://github.com/emmanueluwa/",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;

  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;

  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(fontSize: size));
  }
}

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;

  const AbelCustom({
    super.key,
    @required this.text,
    @required this.size,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final text;
  final containerWidth;
  final hintText;
  final maxLines;
  final controller;
  final validator;

  const TextForm({
    super.key,
    @required this.text,
    @required this.containerWidth,
    @required this.hintText,
    this.maxLines,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text, 16.0),
        const SizedBox(height: 5),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            validator: validator,
            controller: controller,
            inputFormatters: [LengthLimitingTextInputFormatter(1000)],
            maxLines: maxLines,
            decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14.0),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;

  const AnimatedCard({
    super.key,
    @required this.imagePath,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.redAccent),
        ),
        shadowColor: Colors.redAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200.0,
                width: widget.width ?? 200.0,
                fit: widget.fit == null ? widget.fit : null,
                filterQuality: FilterQuality.high,
              ),
              SizedBox(height: 10.0),
              widget.text != null
                  ? SansBold(widget.text, 15.0)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class FormService {
  var logger = Logger(printer: PrettyPrinter());

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  addDataFromForm(
    final name,
    final company,
    final email,
    final number,
    final message,
  ) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(ApiConfig.createMessageUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": name,
          "company": company,
          "email": email,
          "phone_number": number,
          "message": message,
        }),
      );

      if (response.statusCode == 200) {
        logger.d("form sent successfully");
        return true;
      } else {
        logger.d("something went wrong");
        return false;
      }
    } catch (e) {
      logger.d("Exception: $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}

Future DialogSuccess(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: SansBold("Message sent", 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Ok"),
        ),
      ],
    ),
  );
}

Future DialogFailed(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: SansBold("Error", 20.0),
      content: Sans(
        "Faled to send message. Please try again or contact me through social media.",
        15.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Ok"),
        ),
      ],
    ),
  );
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return Form(
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
          SizedBox(height: 20.0),
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
            onPressed: isSubmitting
                ? null
                : () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isSubmitting = true;
                      });

                      final addData = FormService();
                      final success = await addData.addDataFromForm(
                        _nameController.text,
                        _companyNameController.text,
                        _emailController.text,
                        _phoneController.text,
                        _messageController.text,
                      );

                      setState(() {
                        isSubmitting = false;
                      });

                      if (success) {
                        formKey.currentState!.reset();
                        DialogSuccess(context);
                      } else {
                        DialogFailed(context);
                      }
                    }
                  },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: 200.0,
            color: Colors.redAccent,
            child: isSubmitting
                ? CircularProgressIndicator(color: Colors.redAccent)
                : SansBold("Submit", 20.0),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return Form(
      key: formKey,
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
            controller: _nameController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Name is required";
              }
            },
          ),
          TextForm(
            text: "Company",
            containerWidth: widthDevice / 1.4,
            hintText: "Please enter your company name.",
            controller: _companyNameController,
          ),
          TextForm(
            text: "Phone number",
            containerWidth: widthDevice / 1.4,
            hintText: "Please enter your phone number.",
            controller: _phoneController,
          ),
          TextForm(
            text: "Email",
            containerWidth: widthDevice / 1.4,
            hintText: "Please enter your email.",
            controller: _emailController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Email is required";
              }
            },
          ),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.4,
            hintText: "Please enter your message.",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Message is required";
              }
            },
          ),

          MaterialButton(
            onPressed: isSubmitting
                ? null
                : () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isSubmitting = true;
                      });

                      final addData = FormService();
                      final success = await addData.addDataFromForm(
                        _nameController.text,
                        _companyNameController.text,
                        _emailController.text,
                        _phoneController.text,
                        _messageController.text,
                      );

                      setState(() {
                        isSubmitting = false;
                      });

                      if (success) {
                        formKey.currentState!.reset();
                        DialogSuccess(context);
                      } else {
                        DialogFailed(context);
                      }
                    }
                  },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: widthDevice / 2.2,
            color: Colors.redAccent,
            child: isSubmitting
                ? CircularProgressIndicator(color: Colors.redAccent)
                : SansBold("Submit", 20.0),
          ),
        ],
      ),
    );
  }
}
