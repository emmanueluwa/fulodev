import "package:flutter/material.dart";
import "package:fulodev/mobile/about_mobile.dart";
import "package:fulodev/mobile/contact_mobile.dart";
import "package:fulodev/mobile/landing_page_mobile.dart";
import "package:fulodev/mobile/works_mobile.dart";
import "package:fulodev/web/about_web.dart";
import "package:fulodev/web/contact_web.dart";
import "package:fulodev/web/landing_page_web.dart";
import "package:fulodev/web/works_web.dart";

import "common/blog.dart";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const LandingPageWeb();
              } else {
                return const LandingPageMobile();
              }
            },
          ),
        );

      case "/contact":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const ContactWeb();
              } else {
                return const ContactMobile();
              }
            },
          ),
        );

      case "/about":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const AboutWeb();
              } else {
                return const AboutMobile();
              }
            },
          ),
        );

      case "/blog":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlogPage(),
        );

      case "/works":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const WorksWeb();
              } else {
                return const WorksMobile();
              }
            },
          ),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const LandingPageWeb();
              } else {
                return const LandingPageMobile();
              }
            },
          ),
        );
    }
  }
}
