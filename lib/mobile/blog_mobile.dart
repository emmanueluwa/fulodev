import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fulodev/components.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 35.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: AbelCustom(
                    text: "Welcome to my blog",
                    size: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Image.asset(
                  "assets/blog.jpg",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              expandedHeight: 400.0,
            ),
          ];
        },
        body: ListView(
          children: [
            BlogPost(),
            BlogPost(),
            BlogPost(),
            BlogPost(),
            BlogPost(),
          ],
        ),
      ),
    );
  }
}

class BlogPost extends StatefulWidget {
  const BlogPost({super.key});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            width: 3.0,
            color: Colors.black,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: AbelCustom(
                    text: "Hidayah AI",
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.0),
            Text(
              """Hidayah AI
An AI-powered Quran verse finder that helps Muslims discover relevant Quranic verses based on natural language queries like "verses about patience" or "guidance during hardship." Returns matching verses with Tafsir Ibn Kathir explanations, bookmarking, and search history.
Tech Stack:

Frontend: Flutter (Dart) - cross-platform mobile app
Backend: FastAPI (Python) with LangChain framework
AI/ML: OpenAI API for embeddings and completions
Vector Database: Pinecone for semantic search
Database: PostgreSQL for user queries, bookmarks, and history
Additional: Pydantic for validation, SQLAlchemy ORM

System Design:

User submits query via Flutter app
FastAPI backend generates embedding using OpenAI
Pinecone performs vector similarity search across 15,563 Tafsir Ibn Kathir chunks
LangChain orchestrates retrieval and response generation
Relevant verses + Tafsir returned to user
Query logged and bookmarks stored in PostgreSQL
Session cookies track user activity across requests""",
              style: GoogleFonts.openSans(fontSize: 15.0),
              maxLines: expand == true ? null : 3,
              overflow: expand == true
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
