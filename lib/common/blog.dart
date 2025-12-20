import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fulodev/components.dart';
import 'package:fulodev/config/api_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Blog {
  final String title;
  final String text;

  Blog({required this.title, required this.text});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(title: json["title"], text: json["text"]);
  }
}

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List<Blog> blogs = [];
  bool isLoading = true;
  String? errorMessage;

  void fetchBlogs() async {
    try {
      final response = await http
          .get(
            Uri.parse(ApiConfig.blogUrl),
            headers: {"Content-Type": "application/json"},
          )
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        setState(() {
          blogs = data.map((json) => Blog.fromJson(json)).toList();
          isLoading = false;
        });
      } else if (response.statusCode == 404) {
        setState(() {
          blogs = [];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Failed to load blogs: ${response.statusCode}";
          isLoading = false;
        });
      }
    } on http.ClientException {
      //network error server down/no internet
      setState(() {
        errorMessage =
            "Cannot connect to server. Please check your connection.";
        isLoading = false;
      });
    } on TimeoutException {
      setState(() {
        errorMessage = "Request timeout out. Please try again.";
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Error: $e";
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 800;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        endDrawer: DrawersMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 35.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: isWeb ? false : true,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: isWeb ? 7.0 : 4.0,
                    ),
                    child: AbelCustom(
                      text: "Welcome to my blog",
                      size: isWeb ? 30.0 : 24.0,
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
                expandedHeight: isWeb ? 500.0 : 400.0,
              ),
            ];
          },
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    bool isWeb = MediaQuery.of(context).size.width > 800;

    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: Colors.redAccent));
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage!, style: TextStyle(color: Colors.red)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                  errorMessage = null;
                });
                fetchBlogs();
              },
              child: Text("Retry"),
            ),
          ],
        ),
      );
    }

    if (blogs.isEmpty) {
      return Center(child: Text("No blogs yet"));
    }

    return ListView.builder(
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        return BlogPost(blog: blogs[index], isWeb: isWeb);
      },
    );
  }
}

class BlogPost extends StatefulWidget {
  final blog;
  final isWeb;

  const BlogPost({super.key, required this.blog, required this.isWeb});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isWeb
          ? EdgeInsets.only(left: 70.0, right: 70.0, top: 40.0)
          : EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
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
                    text: widget.blog.title,
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
                    expand
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_circle_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.0),
            Text(
              widget.blog.text,
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
