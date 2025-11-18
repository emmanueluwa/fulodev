//file for widgets used throughout the app
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget {
  final title;

  const TabsWeb(this.title, {super.key});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
            ? GoogleFonts.archivoBlack(
                shadows: [Shadow(color: Colors.black, offset: Offset(0, -8))],
                color: Colors.transparent,
                fontSize: 25.0,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                decorationColor: Colors.redAccent,
              )
            : GoogleFonts.archivoBlack(color: Colors.black, fontSize: 23.0),
        child: Text(widget.title),
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
